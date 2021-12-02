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

let {useQuery, queryOptions} = module(ReactQuery)

let handleFetch = params => {
  open Promise

  QueryClient.get(~url=`/articles?${params}`)->thenResolve(apiResponse_decode)
}

let useArticles = (~author=?, ~tag=?, ~favorited=?, ~limit=5, ~offset=0, ()) => {
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

  let response = switch fetchResult {
  | {isLoading: true} => Loading
  | {isError: true} => Error
  | {data: Some(Error(_))} => DecodeError
  | {data: Some(Ok({articles: []}))} => Empty
  | {data: Some(Ok({articles, articlesCount}))} => Data(articles, articlesCount)
  | _ => Empty
  }

  (response, pagination, handlePageChange)
}
