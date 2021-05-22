open Render
open Storybook

let onClick = event => Js.log(event)

storiesOf("Button", Helpers.storybookModule)
->add("Basic usage", () => {
  let handleClick = event => {
    Js.log(("onClick => ", event))
  }
  <Button onClick={handleClick}> {`Click here`->s} </Button>
})
->add("Full width", () => {
  <Button onClick block=true> {`Click here`->s} </Button>
})
->ignore
