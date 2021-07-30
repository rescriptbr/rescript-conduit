open UI
open Render

let wrapper = Emotion.Raw.css(
  `
  background: ${Theme.Colors.blue};
  overflow: hidden;
`,
)

@react.component
let make = () => {
  let (_, devices) = Devices.useDevice()

  <Flex height=[xxs(100.0->#pct)]>
    <Box
      display=[xxs(#none), md(#flex)]
      flexDirection=[xxs(#column)]
      p=[xxs(6)]
      position=[xxs(#relative)]
      xxs=#6
      className=wrapper>
      <Box flexGrow=[xxs(#number(1.0))] width=[xxs(15.0->#rem)]> <Logo /> </Box>
      <Box flexGrow=[xxs(#number(3.0))] pt=[xxs(8)]>
        <Typography.Title level=#3 color=Theme.Colors.white>
          {`A place to share knowledge`->s}
        </Typography.Title>
        <Typography.Paragraph level=#1 color=Theme.Colors.white>
          {`Where good ideas find you.`->s}
        </Typography.Paragraph>
      </Box>
      <Box position=[xxs(#absolute)] bottom=[xxs(-5.0->#rem)] left=[xxs(-5.0->#rem)]>
        <img src=Assets.signinIllustration />
      </Box>
    </Box>
    <Box
      display=[xxs(#flex)]
      justifyContent=[xxs(#center)]
      alignItems=[xxs(#center)]
      xxs=#12
      md=#6
      px=[xxs(6), xs(8), sm(12), md(0)]>
      <Box
        display=[xxs(#flex)]
        flexDirection=[xxs(#column)]
        maxW=[xxs(100.0->#pct), md(42.0->#rem)]
        width=[xxs(100.0->#pct)]>
        <Typography.Title level=#4> {`Sign in`->s} </Typography.Title>
        <Typography.Paragraph level=#2>
          {`Don't have an account? `->s} <Link> {`Sign in`->s} </Link>
        </Typography.Paragraph>
        <Box mt=[xxs(6)] mb=[xxs(4)]> <Input placeholder="Email" /> </Box>
        <Box mb=[xxs(4)]> <Input placeholder="Password" /> </Box>
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
  </Flex>
}
