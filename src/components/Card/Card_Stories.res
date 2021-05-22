open Storybook
open Render

storiesOf("Card", Helpers.storybookModule)
->add("Basic usage", () => {
  <Card>
    <Typography level=#h1 variant=#title>
      {"ReScript & React.js - Real World App"->s}
    </Typography>

    <Typography>
      {"Texto"->s}
    </Typography>
  </Card>
})
->ignore
