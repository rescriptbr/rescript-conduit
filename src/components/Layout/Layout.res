open AncestorConduit

@react.component
let make = (~children) => {
  <Box> <Header /> {children} </Box>
}
