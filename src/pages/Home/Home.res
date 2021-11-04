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
  let (tab, setTab) = React.useState(_ => 0)

  <Box>
    <Tabs current={tab} tabs onChange={id => setTab(_ => id)} />
    <Tabs.Panel active={tab === 0}> <GlobalFeed /> </Tabs.Panel>
    <Tabs.Panel active={tab === 1}> {`Tab 2`->s} </Tabs.Panel>
  </Box>
}
