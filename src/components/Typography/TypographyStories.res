open Storybook
open Render

storiesOf("Typography", Helpers.storybookModule)
->add("Basic usage", () => {
  <Typography.Paragraph> {`Don’t have an account?`->s} </Typography.Paragraph>
})
->add("Title 1", () => {
  <Typography.Title level=#1> {`Title 1`->s} </Typography.Title>
})
->add("Title 2", () => {
  <Typography.Title level=#2> {`Title 2`->s} </Typography.Title>
})
->ignore
