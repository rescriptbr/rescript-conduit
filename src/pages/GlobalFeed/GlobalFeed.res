open AncestorConduit
open Render

@react.component
let make = () => {
  let result = UseArticlesHook.useArticles()

  switch result {
  | Data(articles) =>
    <Grid pt=[xs(4)]>
      <Box columns=[xs(#8)]>
        {articles->map((article, key) => {
          <ArticleCard key title=article.title body=article.body author=article.author />
        })}
      </Box>
    </Grid>
  | _ => React.null
  }
}
