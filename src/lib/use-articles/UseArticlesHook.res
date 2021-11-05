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
  | Data(array<article>)
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

let useArticles = (~author=?, ~tag=?, ~favorited=?, ~limit=20, ~offset=0, ()) => {
  let params = Qs.stringify({
    "author": author,
    "tag": tag,
    "favorited": favorited,
    "limit": limit,
    "offset": offset,
  })

  let result = useQuery(
    queryOptions(~queryKey=`articles:${params}`, ~queryFn=_ => handleFetch(params), ()),
  )

  switch result {
  | {isLoading: true} => Loading
  | {isError: true} => Error
  | {data: Some(Error(_))} => DecodeError
  | {data: Some(Ok({articles: []}))} => Empty
  | {data: Some(Ok({articles}))} => Data(articles)
  | _ => Empty
  }
}
