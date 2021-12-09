open AncestorConduit
open Render

module ContentLoader = {
  @react.component
  let make = () => {
    <ContentLoader
      speed={2}
      width=`100%`
      height=`648`
      backgroundColor={Theme.Colors.neutral["50"]}
      foregroundColor={Theme.Colors.neutral["100"]}>
      <rect x="0" y="0" rx=Theme.Radius.small ry=Theme.Radius.small width="100%" height="200" />
      <rect x="0" y="224" rx=Theme.Radius.small ry=Theme.Radius.small width="100%" height="200" />
      <rect x="0" y="448" rx=Theme.Radius.small ry=Theme.Radius.small width="100%" height="200" />
    </ContentLoader>
  }
}

@react.component
let make = () => {
  let (result, pagination, handlePageChange, favoriteArticle) = UseArticlesHook.useArticles()

  <Box>
    <Grid pt=[xs(4)]>
      <Box columns=[xs(#12), md(#8)]>
        {switch result {
        | Data(articles, articlesCount) => <>
            {articles->map((article, key) => {
              <ArticleCard
                key
                title=article.title
                body=article.body
                favoritesCount=article.favoritesCount
                updatedAt=article.updatedAt
                author=article.author
                favorited=article.favorited
                onFavorite={_ => favoriteArticle(article.favorited, article.slug)}
              />
            })}
            <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
              <Pagination
                count={articlesCount}
                activePage=pagination.offset
                limit=pagination.limit
                onPageChange={handlePageChange}
              />
            </Box>
          </>
        | Loading => <ContentLoader />
        | _ => React.null
        }}
      </Box>
    </Grid>
  </Box>
}
