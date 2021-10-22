open AncestorConduit
open Render

let {useArticles} = module(UseArticlesHook)

let tabs: Tabs.tabs<int> = [
  {
    label: "Global feed",
    id: 0,
  },
  {
    label: "Your feed",
    id: 1,
  },
]

@react.component
let make = () => {
  let result = useArticles(~author="johndoe", ())

  let (tab, setTab) = React.useState(_ => 0)

  Js.log(
    switch result {
    | Loading => "Loading"
    | Error
    | DecodeError => "Error"
    | Empty => "No articles"
    | Data(articles) => `Articles list: ${articles->Js.Array2.length->Js.Int.toString}`
    },
  )

  <Box>
    <Tabs current={tab} tabs onChange={id => setTab(_ => id)} />
    <Tabs.Panel active={tab === 0}> {`Tab 1`->s} </Tabs.Panel>
    <Tabs.Panel active={tab === 1}> {`Tab 2`->s} </Tabs.Panel>
  </Box>
}
