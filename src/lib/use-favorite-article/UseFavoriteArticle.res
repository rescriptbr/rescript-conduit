let {useMutation, mutationOptions} = module(ReactQuery)

let handleFavorite = slug => {
  QueryClient.post(~url=`/articles/${slug}/favorite`, None)
}

let useFavoriteArticle = (~slug) => {
  let {mutate} = useMutation(
    mutationOptions(
      //
      ~mutationKey=`/favorite/${slug}`,
      ~mutationFn=_ => handleFavorite(slug),
      (),
    ),
  )
}
