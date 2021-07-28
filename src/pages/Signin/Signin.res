open! UI
open Render

let wrapper = Emotion.Raw.css(
  `
  background: ${Theme.Colors.blue};
`,
)

let formWrapper = Emotion.Raw.css(
  `
  max-width: 100%;
  `->Devices.Raw.md(`
    max-width: 40.0rem;
  `),
)

@react.component
let make = () => {
  <Flex height=[xxs(100.0->#pct)]>
    <Box display=[xxs(#none), md(#block)] p=[xxs(6)] className=wrapper xxs=#6> {`Box`->s} </Box>
    <Box display=[xxs(#flex)] justifyContent=[xxs(#center)] alignItems=[xxs(#center)] xxs=#12 md=#6>
      <Box display=[xxs(#flex)] flexDirection=[xxs(#column)] className=formWrapper>
        <Typography variant=#title level=#1> {`Sign in`->s} </Typography>
        <Typography variant=#text level=#1>
          {`Don't have an account? `->s} <Link> {`Sign in`->s} </Link>
        </Typography>
        <Box mt=[xxs(6)] mb=[xxs(4)]> <Input placeholder="Email" /> </Box>
        <Box mb=[xxs(4)]> <Input placeholder="Password" /> </Box>
        <Button block=true> {`Sign in`->s} </Button>
        <Box mt=[xxs(6)]>
          <Typography variant=#text>
            {`Skip sign-in for now and `->s} <Link> {`start reading`->s} </Link>
          </Typography>
        </Box>
      </Box>
    </Box>
  </Flex>
}
