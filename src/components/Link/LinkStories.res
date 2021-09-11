open Storybook
open Render

storiesOf("Link", Helpers.storybookModule)
->add("Basic usage", () => {
  <Link to_=Signup> {`Sign up`->s} </Link>
})
->ignore
