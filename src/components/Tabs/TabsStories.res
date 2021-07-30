open Storybook
open Render

storiesOf("Tabs", Helpers.storybookModule)
->add("Basic usage", () => {
  let (tab, setTab) = React.useState(_ => 0)

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

  <div>
    <Tabs current={tab} tabs onChange={id => setTab(_ => id)} />
    <br />
    <div>
      <Tabs.Panel active={tab === 0}>
        <Card> <Typography.Title level=#4> {`The global feed...`->s} </Typography.Title> </Card>
      </Tabs.Panel>
      <Tabs.Panel active={tab === 1}>
        <Card>
          <Typography.Title level=#4>
            {"ReScript & React.js - Real World App"->s}
          </Typography.Title>
          <Typography.Paragraph> {"Texto"->s} </Typography.Paragraph>
        </Card>
      </Tabs.Panel>
    </div>
  </div>
})
->ignore
