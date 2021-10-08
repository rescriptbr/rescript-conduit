open AncestorConduit
open Render

module Styles = {
  open Emotion

  let header = css({
    "background": Theme.Colors.white,
    "boxShadow": "0px 1px 0px rgba(71, 123, 255, 0.1)",
    "padding": `${Theme.Spacing.make(4.)} ${Theme.Spacing.make(8.)}`,
  })
}

module Avatar = {
  @react.component
  let make = (~image) => {
    <Box ml=[xs(2)]>
      {switch image {
      | None =>
        <Base
          fontSize=[xs(1.6->#rem)]
          color=[xs(Theme.Colors.white->#hex)]
          display=[xs(#flex)]
          alignItems=[xs(#center)]
          justifyContent=[xs(#center)]
          borderRadius=[xs(3)]
          width=[xs(4.8->#rem)]
          height=[xs(4.8->#rem)]
          bgColor=[xs(Theme.Colors.blue->#hex)]>
          {`M`->s}
        </Base>
      | Some(src) =>
        <Base tag=#img borderRadius=[xs(3)] width=[xs(4.8->#rem)] height=[xs(4.8->#rem)] src />
      }}
    </Box>
  }
}
@react.component
let make = () => {
  let result = UseMeHook.useMe()

  <Box tag=#header className=Styles.header>
    <Grid justifyContent=[xs(#"space-between")]>
      <Box columns=[xs(#3)]> <Box maxW=[xs(15.0->#rem)]> <Logo /> </Box> </Box>
      <Box>
        {switch result {
        | Data(user) =>
          <Box display=[xs(#flex)] alignItems=[xs(#center)]>
            <Typography.Title level=#6> {user.username->s} </Typography.Title>
            <Avatar
              image={switch user.image {
              | "" => None
              | image => Some(image)
              }}
            />
          </Box>
        | Loading => <Typography.Paragraph> {`Loading...`->s} </Typography.Paragraph>
        | Error
        | DecodeError =>
          <Link to_=Signin> {`Sign in`->s} </Link>
        }}
      </Box>
    </Grid>
  </Box>
}
