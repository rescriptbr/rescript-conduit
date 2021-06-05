open Storybook
open Render

storiesOf("Typography", Helpers.storybookModule)
->add("Basic usage", () => {
  <Typography> {`Don’t have an account?`->s} </Typography>
})
->add("Title 1", () => {
  <Typography variant=#title level=#1> {`Title 1`->s} </Typography>
})
->add("Title 2", () => {
  <Typography variant=#title level=#2> {`Title 2`->s} </Typography>
})
->ignore
