open AncestorConduit
open Render

module Styles = {
  open Emotion

  let card = css({
    "boxShadow": "0px 1px 0px rgba(71, 123, 255, 0.1)",
  })
}

module Card = {
  @react.component
  let make = (~children) => {
    <Box
      className=Styles.card p=[xs(4)] borderRadius=[xs(1)] bgColor=[xs(Theme.Colors2.white->#hex)]>
      {children}
    </Box>
  }
}

module PersonalForm = {
  @react.component
  let make = () => {
    <Card>
      <Box mb=[xs(2)]> <Input placeholder="Photo URL" /> </Box>
      <Box mb=[xs(2)]> <Input placeholder="Username" /> </Box>
      <Box mb=[xs(2)]> <TextArea placeholder="Share about you" /> </Box>
      <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
        <Box width=[xs(26.0->#rem)]> <Button block=true> {`Save`->s} </Button> </Box>
      </Box>
    </Card>
  }
}

@react.component
let make = () => {
  <Grid justifyContent=[xs(#"space-between")]>
    <Box columns=[xs(#3)]>
      <Typography.Title level=#5> {`Your settings`->s} </Typography.Title>
    </Box>
    <Box columns=[xs(#6)]> <PersonalForm /> </Box>
  </Grid>
}
