open Render
open Storybook

storiesOf("Button", Helpers.storybookModule)
->add("Basic usage", () => {
  <Button> {`Click here`->s} </Button>
})
->add("Block prop", () => {
  <Button block=true> {`Click here`->s} </Button>
})
->ignore
