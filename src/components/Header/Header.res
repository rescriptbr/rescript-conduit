open AncestorConduit
open Render

module Styles = {
  open Emotion

  let header = css({
    "boxShadow": "0px 1px 0px rgba(71, 123, 255, 0.1)",
    "padding": `${Theme.Spacing.make(4.)} ${Theme.Spacing.make(8.)}`,
  })
}

@react.component
let make = () => {
  let result = UseMeHook.useMe()

  <Box tag=#header className=Styles.header>
    <Grid justifyContent=[xs(#"space-between")]>
      <Box columns=[xs(#3)]> <Box maxW=[xs(15.0->#rem)]> <Logo /> </Box> </Box>
      <Box>
        {switch result {
        | Data(user) => <Typography.Paragraph> {user.username->s} </Typography.Paragraph>
        | Loading => <Typography.Paragraph> {`Loading...`->s} </Typography.Paragraph>
        | Error
        | DecodeError =>
          <Typography.Paragraph> {`Something went wrong :(`->s} </Typography.Paragraph>
        }}
      </Box>
    </Grid>
  </Box>
}
