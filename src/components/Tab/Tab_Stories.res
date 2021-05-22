open Storybook
open Render

storiesOf("Tab", Helpers.storybookModule)
->add("Basic usage", () => {
  <Tab>
    <Tab.Pane>
      {"Tab content for your feed"->s}
    </Tab.Pane>

    <Tab.Pane>
      {"Tab content for global feed"->s}
    </Tab.Pane>
  </Tab>
})
->ignore
