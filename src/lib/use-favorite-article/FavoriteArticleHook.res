let {useMutation, mutationOptions} = module(ReactQuery)

let handleFavorite = (slug: string) => QueryClient.post(~url=`/articles/${slug}/favorite`, None)

let handleUnfavorite = (slug: string) => QueryClient.delete(~url=`/articles/${slug}/favorite`)

let useFavorite = (~onMutate, ~onError) => {
  let {mutate: favoriteMutation} = useMutation(
    mutationOptions(~mutationFn=handleFavorite, ~onMutate, ~onError, ()),
  )
  let {mutate: unfavoriteMutation} = useMutation(
    mutationOptions(~mutationFn=handleUnfavorite, ~onMutate, ~onError, ()),
  )

  let favorite = slug => favoriteMutation(. slug, None)
  let unfavoriteMutation = slug => unfavoriteMutation(. slug, None)

  (favorite, unfavoriteMutation)
}
