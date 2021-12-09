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

  let fetchResult = useQuery(
    queryOptions(
      ~queryKey=`articles:${params}`,
      ~refetchOnWindowFocus=ReactQuery_Utils.refetchOnWindowFocus(#bool(false)),
      ~queryFn=_ => handleFetch(params),
      (),
    ),
  )

  let onFavoriteSuccess = () => {
    fetchResult.refetch({
      throwOnError: false,
      cancelRefetch: false,
    })->ignore
  }

  let (favoriteMutation, unfavoriteMutation) = FavoriteArticleHook.useFavorite(
    ~onMutate=slug => {
      let maybeArticles: Belt.Result.t<apiResponse, string> = queryClient.getQueryData(.
        `articles:${params}`,
      )

      Js.log(
        switch maybeArticles {
        | Error(_) => ()
        | Ok(response) => Js.log(response)
        },
      )
      /* switch maybeArticles { */
      /* | None => Js.log(`None`) */
      /* | Some(response) => */
      /* switch response { */
      /* | None => Js.log(`None`) */
      /* | Some(response2) => Js.log(Obj.magic(response2)["_0"]) */
      /* } */
      /* } */

      /* let updatedArticles = maybeArticles->Belt.Option.map(response => { */
      /* response.articles->Js.Array2.map(article => */
      /* switch article.slug === slug { */
      /* | false => article */
      /* | true => {...article, favorited: !article.favorited} */
      /* } */
      /* ) */
      /* }) */
      /* Js.log(updatedArticles) */
      onFavoriteSuccess()
      Promise.resolve(`Result...`)
    },
    ~onError=(_, _, maybeContext) => {
      Js.log(maybeContext)

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
