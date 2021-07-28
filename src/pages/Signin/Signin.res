open! UI
open Render

let wrapper = Emotion.Raw.css(
  `
  background: ${Theme.Colors.blue};
`,
)

let formWrapper = Emotion.Raw.css(`
  max-width: 40.0rem;
`)

@react.component
let make = () => {
  <Flex>
    <Box p={6->all} className=wrapper xxs=#6> {`Box`->s} </Box>
    <Box display={#flex->all} justifyContent={#center->all} alignItems={#center->all} xxs=#6>
      <Box display={#flex->all} flexDirection={#column->all} className=formWrapper>
        <Typography variant=#title level=#1> {`Sign in`->s} </Typography>
        <Typography variant=#text level=#1>
          {`Don't have an account? `->s} <Link> {`Sign in`->s} </Link>
        </Typography>
        <Box mt={6->all} mb={4->all}> <Input placeholder="Email" /> </Box>
        <Box mb={4->all}> <Input placeholder="Password" /> </Box>
        <Button block=true> {`Sign in`->s} </Button>
        <Box mt={6->all}>
          <Typography variant=#text>
            {`Skip sign-in for now and`->s} <Link> {` start reading`->s} </Link>
          </Typography>
        </Box>
      </Box>
    </Box>
  </Flex>
}
