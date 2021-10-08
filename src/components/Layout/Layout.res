open AncestorConduit

@react.component
let make = (~children) => {
  <Box>
    <Header />
    <Box display=[xs(#flex)] justifyContent=[xs(#center)]>
      <Box py=[xs(8)] px=[xs(4)] width=[xs(100.0->#pct)] maxW=[xs(1280->#px)]> {children} </Box>
    </Box>
  </Box>
}
