open Storybook

storiesOf("Input", Helpers.storybookModule)
->add("Basic usage", () => {
  <Input placeholder="Some placeholder here" />
})
->add("Input label", () => {
  <>
    <Input label="E-mail" placeholder="E-mail here" type_="email" />
    <br />
    <Input label="Password" placeholder="Password here" type_="password" />
  </>
})
->ignore
