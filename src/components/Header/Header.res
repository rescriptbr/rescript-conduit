open AncestorConduit
open Render

module Styles = {
  open Emotion

  let header = css({
    "background": Theme.Colors.white,
    "boxShadow": "0px 1px 0px rgba(71, 123, 255, 0.1)",
    "padding": `0 ${Theme.Spacing.make(8.)}`,
    "height": `11.6rem`,
    "display": "flex",
    "alignItems": "center",
  })
}

@react.component
let make = () => {
  let result = UseMeHook.useMe()

  <Box tag=#header className=Styles.header>
    <Grid justifyContent=[xs(#"space-between")]>
      <Box display=[xs(#flex)] alignItems=[xs(#center)] maxW=[xs(15.0->#rem)]>
        <FramerMotion.Element initial={"opacity": 0, "x": -50} animate={"opacity": 1, "x": 0}>
          <Logo />
        </FramerMotion.Element>
      </Box>
      <Box>
        {switch result {
        | Data(user) =>
          <FramerMotion.Element initial={"opacity": 0, "x": 50} animate={"opacity": 1, "x": 0}>
            <Box display=[xs(#flex)] alignItems=[xs(#center)]>
              <Typography.Title level=#6 noMargin=true> {user.username->s} </Typography.Title>
              <Box ml=[xs(2)]>
                <Avatar
                  name=user.username
                  image={switch user.image {
                  | "" => None
                  | image => Some(image)
                  }}
                />
              </Box>
            </Box>
          </FramerMotion.Element>
        | Loading => React.null
        | Error
        | DecodeError =>
          <Link to_=Signin> {`Sign in`->s} </Link>
        }}
      </Box>
    </Grid>
  </Box>
}
