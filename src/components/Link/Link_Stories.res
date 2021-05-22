open Storybook
open Render

storiesOf("Link", Helpers.storybookModule)
->add("Basic usage", () => {
  <Link> {`Sign up`->s} </Link>
})
->ignore
