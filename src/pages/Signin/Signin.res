open Render
open AncestorConduit

@react.component
let make = () => {
  let {form, isLoading, error} = SigninHooks.useSignin()
  let (_, devices) = Media.useDevice()

  let hasInvalidFields = FormHelpers.hasInvalidFields(form.fieldsState)

  <Grid height=[xs(100.0->#pct)]>
    <Box
      display=[xs(#none), md(#flex)]
      flexDirection=[xs(#column)]
      p=[xs(6)]
      position=[xs(#relative)]
      columns=[xs(#6)]
      overflow=[xs(#hidden)]
      bgColor=[xs(Theme.TypedColors.primary["400"])]>
      <Box flexGrow=[xs(#num(1.0))] width=[xs(15.0->#rem)]>
        <Animations.FadeIn delay=0.1> <Logo variant=#white /> </Animations.FadeIn>
      </Box>
      <Box flexGrow=[xs(#num(3.0))] pt=[xs(4)]>
        <Animations.FadeIn delay=0.2>
          <Typography.Title level=#3 color=Theme.Colors2.white>
            {`A place to share knowledge`->s}
          </Typography.Title>
        </Animations.FadeIn>
        <Animations.FadeIn delay=0.4>
          <Typography.Paragraph
            level=#1 color={Theme.Colors2.white->Polished.Color.transparentize(~amount=0.4)}>
            {`Where good ideas find you.`->s}
          </Typography.Paragraph>
        </Animations.FadeIn>
      </Box>
      <Animations.FadeIn y=0 delay=0.6>
        <Base
          tag=#img
          width=[xs(40.->#rem)]
          position=[xs(#absolute)]
          bottom=[xs(0.->#rem)]
          left=[xs(0.->#rem)]
          src=Assets.signinIllustration
        />
      </Animations.FadeIn>
    </Box>
    <Box
      bgColor=[xs(Theme.TypedColors.background)]
      tag=#form
      onSubmit={event => {
        ReactEvent.Synthetic.preventDefault(event)
        form.submit()
      }}
      display=[xs(#flex)]
      justifyContent=[xs(#center)]
      alignItems=[xs(#center)]
      columns=[xs(#12), md(#6)]
      px=[xs(6), xs(8), sm(12), md(0)]>
      <Box
        display=[xs(#flex)]
        flexDirection=[xs(#column)]
        maxW=[xs(100.0->#pct), md(42.0->#rem)]
        width=[xs(100.0->#pct)]>
        <Animations.FadeIn delay=0.4>
          <Typography.Title level=#4> {`Sign in`->s} </Typography.Title>
        </Animations.FadeIn>
        <Animations.FadeIn delay=0.6>
          <Typography.Paragraph level=#2>
            {`Don't have an account? `->s} <Link to_=Signup> {`Sign up`->s} </Link>
          </Typography.Paragraph>
        </Animations.FadeIn>
        <Box mt=[xs(3)]>
          <Alert visible={Belt.Option.isSome(error)} variant=#error>
            {switch error {
            | None => React.null
            | Some(InvalidLogin) => `Invalid email or password`->s
            | Some(UnexpectedError) => `Unexpected error`->s
            }}
          </Alert>
        </Box>
        <Box mt=[xs(3)] mb=[xs(2)]>
          <Animations.FadeIn delay=0.7>
            <Input
              error={form.getFieldError(Field(Email))}
              onChange={FormHelpers.getInputValue(form.handleChange(Email))}
              placeholder="Email"
              type_="text"
            />
          </Animations.FadeIn>
        </Box>
        <Box mb=[xs(2)]>
          <Animations.FadeIn delay=0.8>
            <Input
              error={form.getFieldError(Field(Password))}
              onChange={FormHelpers.getInputValue(form.handleChange(Password))}
              placeholder="Password"
              type_="password"
            />
          </Animations.FadeIn>
        </Box>
        <Animations.FadeIn delay=0.9>
          <Button
            loading={isLoading}
            disabled={hasInvalidFields || form.formState === Pristine || isLoading}
            block=true>
            {`Sign in`->s}
          </Button>
        </Animations.FadeIn>
        <Box mt=[xs(6)]>
          <Animations.FadeIn delay=0.95>
            <Typography.Paragraph align={devices.md ? #left : #center} level=#2>
              {`Skip sign-in for now and `->s}
              {devices.md ? React.null : <br />}
              <Link to_=Home> {`start reading`->s} </Link>
            </Typography.Paragraph>
          </Animations.FadeIn>
        </Box>
      </Box>
    </Box>
  </Grid>
}
