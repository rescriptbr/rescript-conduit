open ReScriptToolkit

@decco
type author = {
  bio: string,
  following: bool,
  image: string,
  username: string,
}

@decco
type article = {
  author: author,
  authorId: string,
  body: string,
  createdAt: string,
  description: string,
  favorited: bool,
  favoritesCount: int,
  id: string,
  slug: string,
  tagList: array<string>,
  title: string,
  updatedAt: string,
}

@decco
type apiResponse = {
  articles: array<article>,
  articlesCount: int,
}

type hookResult =
  | Data(array<article>, int)
  | Loading
  | Empty
  | Error
  | DecodeError

module Qs = {
  @module("qs") external stringify: {..} => string = "stringify"
}

let {useQuery, useMutation, mutationOptions, queryOptions} = module(ReactQuery)

let handleFetch = params => {
  open Promise

  QueryClient.get(~url=`/articles?${params}`)->thenResolve(apiResponse_decode)
}

let updateArticlesBySlug = (slug: string, article: article) =>
  switch article.slug === slug {
  | false => article
  | true => {
      ...article,
      favorited: !article.favorited,
      favoritesCount: switch article.favorited {
      | false => article.favoritesCount + 1
      | true => article.favoritesCount - 1
      },
    }
  }

let optionFromResult = result =>
  switch result {
  | Ok(response) => Some(response)
  | Error(_) => None
  }

let useArticles = (~author=?, ~tag=?, ~favorited=?, ~limit=5, ~offset=0, ()) => {
  let queryClient = ReactQuery.useQueryClient()
  let (pagination, handlePageChange) = Pagination.usePagination(~limit, ~offset, ())

  let params = Qs.stringify({
    "author": author,
    "tag": tag,
    "favorited": favorited,
    "limit": pagination.limit,
    "offset": pagination.offset,
  })

  let queryKey = `articles:${params}`

  let fetchResult = useQuery(
    queryOptions(
      ~queryKey,
      ~refetchOnWindowFocus=ReactQuery_Utils.refetchOnWindowFocus(#bool(false)),
      ~queryFn=_ => handleFetch(params),
      (),
    ),
  )

  let (favoriteMutation, unfavoriteMutation) = FavoriteArticleHook.useFavorite(
    ~onMutate=slug => {
      let maybeResponse: option<
        Belt.Result.t<apiResponse, Decco.decodeError>,
      > = queryClient.getQueryData(. queryKey)

      maybeResponse
      ->Belt.Option.flatMap(optionFromResult)
      ->Belt.Option.map(response => {
        let updatedArticles = response.articles->Array.map(updateArticlesBySlug(slug))
        let updatedResponse = {...response, articles: updatedArticles}

        queryClient.setQueryData(. queryKey, Ok(updatedResponse))->ignore

        response
      })
      ->Promise.resolve
    },
    ~onError=(_, _, maybeValue) => {
      switch maybeValue {
      | None => ()
      | Some(response) => queryClient.setQueryData(. queryKey, Ok(response))->ignore
      }
      Promise.resolve()
    },
  )

  let toggleFavorite = (favorited: bool, slug: string) => {
    switch favorited {
    | false => favoriteMutation(slug)
    | true => unfavoriteMutation(slug)
    }
    ()
  }

  let response = switch fetchResult {
  | {isLoading: true} => Loading
  | {isError: true} => Error
  | {data: Some(Error(_))} => DecodeError
  | {data: Some(Ok({articles: []}))} => Empty
  | {data: Some(Ok({articles, articlesCount}))} => Data(articles, articlesCount)
  | _ => Empty
  }

  (response, pagination, handlePageChange, toggleFavorite)
}
