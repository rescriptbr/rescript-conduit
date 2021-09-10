open Render
open AncestorConduit

let wrapper = Emotion.Raw.css(
  `
  background: ${Theme.Colors.blue};
  overflow: hidden;
`,
)

@react.component
let make = () => {
  let form = SigninHooks.useSignin()
  let (_, devices) = Devices.useDevice()

  Js.log(("Email", Field(Email)->form.getFieldError))
  Js.log(("Password", Field(Password)->form.getFieldError))

  <Grid height=[xxs(100.0->#pct)]>
    <Box
      display=[xxs(#none), md(#flex)]
      flexDirection=[xxs(#column)]
      p=[xxs(6)]
      position=[xxs(#relative)]
      columns=[xxs(#6)]
      className=wrapper>
      <Box flexGrow=[xxs(#num(1.0))] width=[xxs(15.0->#rem)]> <Logo /> </Box>
      <Box flexGrow=[xxs(#num(3.0))] pt=[xxs(4)]>
        <Typography.Title level=#3 color=Theme.Colors.white>
          {`A place to share knowledge`->s}
        </Typography.Title>
        <Typography.Paragraph
          level=#1 color={Theme.Colors.white->Polished.Color.transparentize(~amount=0.4)}>
          {`Where good ideas find you.`->s}
        </Typography.Paragraph>
      </Box>
      <Box position=[xxs(#absolute)] bottom=[xxs(-5.0->#rem)] left=[xxs(-5.0->#rem)]>
        <img src=Assets.signinIllustration />
      </Box>
    </Box>
    <Box
      tag=#form
      onSubmit={event => {
        ReactEvent.Synthetic.preventDefault(event)
        form.submit()
      }}
      display=[xxs(#flex)]
      justifyContent=[xxs(#center)]
      alignItems=[xxs(#center)]
      columns=[xxs(#12), md(#6)]
      px=[xxs(6), xs(8), sm(12), md(0)]>
      <Box
        display=[xxs(#flex)]
        flexDirection=[xxs(#column)]
        maxW=[xxs(100.0->#pct), md(42.0->#rem)]
        width=[xxs(100.0->#pct)]>
        <Typography.Title level=#4> {`Sign in`->s} </Typography.Title>
        <Typography.Paragraph level=#2>
          {`Don't have an account? `->s} <Link> {`Sign up`->s} </Link>
        </Typography.Paragraph>
        <Box mt=[xxs(6)] mb=[xxs(2)]>
          <Input
            onChange={ReForm.Helpers.handleChange(form.handleChange(Email))}
            placeholder="Email"
            type_="text"
          />
        </Box>
        <Box mb=[xxs(2)]>
          <Input
            onChange={ReForm.Helpers.handleChange(form.handleChange(Password))}
            placeholder="Password"
            type_="password"
          />
        </Box>
        <Button block=true> {`Sign in`->s} </Button>
        <Box mt=[xxs(6)]>
          <Typography.Paragraph align={devices.md ? #left : #center} level=#2>
            {`Skip sign-in for now and `->s}
            {devices.md ? React.null : <br />}
            <Link> {`start reading`->s} </Link>
          </Typography.Paragraph>
        </Box>
      </Box>
    </Box>
  </Grid>
}
