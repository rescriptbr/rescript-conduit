open AncestorConduit
open Render

@react.component
let make = () => {
  let result = UseArticlesHook.useArticles()

  <Box>
    {switch result {
    | Data(articles) =>
      <Grid pt=[xs(4)]>
        <Box columns=[xs(#12), lg(#8)]>
          {articles->map((article, key) => {
            <ArticleCard
              key
              title=article.title
              body=article.body
              favoritesCount=article.favoritesCount
              updatedAt=article.updatedAt
              author=article.author
            />
          })}
        </Box>
      </Grid>
    | _ => React.null
    }}
    <Pagination count={12} onPageChange={event => Js.log(event)} />
  </Box>
}
