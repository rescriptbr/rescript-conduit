open Storybook
open Render

storiesOf("Card", Helpers.storybookModule)
->add("Basic usage", () => {
  <Card>
    <Typography.Title level=#3> {"ReScript & React.js - Real World App"->s} </Typography.Title>
    <Typography.Paragraph> {"Texto"->s} </Typography.Paragraph>
  </Card>
})
->ignore
