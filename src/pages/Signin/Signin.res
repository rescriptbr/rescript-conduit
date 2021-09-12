open Render
open AncestorConduit

module Array = Js.Array2

@react.component
let make = () => {
  let {form, isLoading} = SigninHooks.useSignin()
  let (_, devices) = Media.useDevice()

  let hasInvalidFields = form.fieldsState->Array.some(((_, state)) =>
    switch state {
    | Error(_)
    | Pristine
    | NestedErrors(_) => true
    | _ => false
    }
  )

  <Grid height=[xs(100.0->#pct)]>
    <Box
      display=[xs(#none), md(#flex)]
      flexDirection=[xs(#column)]
      p=[xs(6)]
      position=[xs(#relative)]
      columns=[xs(#6)]
      overflow=[xs(#hidden)]
      bgColor=[xs(Theme.Colors.Ancestor.blue)]>
      <Box flexGrow=[xs(#num(1.0))] width=[xs(15.0->#rem)]> <Logo /> </Box>
      <Box flexGrow=[xs(#num(3.0))] pt=[xs(4)]>
        <Typography.Title level=#3 color=Theme.Colors.white>
          {`A place to share knowledge`->s}
        </Typography.Title>
        <Typography.Paragraph
          level=#1 color={Theme.Colors.white->Polished.Color.transparentize(~amount=0.4)}>
          {`Where good ideas find you.`->s}
        </Typography.Paragraph>
      </Box>
      <Base
        tag=#img
        width=[xs(40.->#rem)]
        position=[xs(#absolute)]
        bottom=[xs(0.->#rem)]
        left=[xs(0.->#rem)]
        src=Assets.signinIllustration
      />
    </Box>
    <Box
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
        <Typography.Title level=#4> {`Sign in`->s} </Typography.Title>
        <Typography.Paragraph level=#2>
          {`Don't have an account? `->s} <Link to_=Signup> {`Sign up`->s} </Link>
        </Typography.Paragraph>
        <Box mt=[xs(6)] mb=[xs(2)]>
          <Input
            error={form.getFieldError(Field(Email))}
            onChange={ReForm.Helpers.handleChange(form.handleChange(Email))}
            placeholder="Email"
            type_="text"
          />
        </Box>
        <Box mb=[xs(2)]>
          <Input
            error={form.getFieldError(Field(Password))}
            onChange={ReForm.Helpers.handleChange(form.handleChange(Password))}
            placeholder="Password"
            type_="password"
          />
        </Box>
        <Button
          loading={isLoading}
          disabled={hasInvalidFields || form.formState === Pristine || isLoading}
          block=true>
          {`Sign in`->s}
        </Button>
        <Box mt=[xs(6)]>
          <Typography.Paragraph align={devices.md ? #left : #center} level=#2>
            {`Skip sign-in for now and `->s}
            {devices.md ? React.null : <br />}
            <Link to_=Home> {`start reading`->s} </Link>
          </Typography.Paragraph>
        </Box>
      </Box>
    </Box>
  </Grid>
}
