open AncestorConduit
open Render

module Styles = {
  open Emotion

  let header = css({
    "background": Theme.Colors2.white,
    "boxShadow": "0px 1px 0px rgba(71, 123, 255, 0.1)",
    "height": `11.6rem`,
    "display": "flex",
    "alignItems": "center",
  })
}

@react.component
let make = () => {
  let result = UseMeHook.useMe()

  <Box tag=#header className=Styles.header p=[xs(4), md(8)]>
    <Grid justifyContent=[xs(#"space-between")]>
      <Box display=[xs(#flex)] alignItems=[xs(#center)] maxW=[xs(15.0->#rem)]>
        <FramerMotion.Element initial={"opacity": 0, "x": -50} animate={"opacity": 1, "x": 0}>
          <Hidden on=[xs(true), md(false)]> <Logo /> </Hidden>
          <Hidden on=[xs(false), md(true)]>
            <Box width=[xs(4.2->#rem)] height=[xs(4.2->#rem)]> <Logo variant=#minimal /> </Box>
          </Hidden>
        </FramerMotion.Element>
      </Box>
      <Box>
        {switch result {
        | Data(user) =>
          <FramerMotion.Element initial={"opacity": 0, "x": 50} animate={"opacity": 1, "x": 0}>
            <Link.Unstyled to_=UserSettings>
              <Box display=[xs(#flex)] alignItems=[xs(#center)]>
                <Hidden on=[xs(true), md(false)]>
                  <Typography.Title level=#6 noMargin=true>
                    {`@${user.username}`->s}
                  </Typography.Title>
                </Hidden>
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
            </Link.Unstyled>
          </FramerMotion.Element>
        | Loading => React.null
        | Error
        | DecodeError =>
          <Button to_=Signin size=#sm> {`Sign in`->s} </Button>
        }}
      </Box>
    </Grid>
  </Box>
}
