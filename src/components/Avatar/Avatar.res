open AncestorConduit
open Render

module String = Js.String2

@react.component
let make = (~image, ~name, ~size=4.8->#rem) => {
  <Box>
    {switch image {
    | None =>
      <Base
        fontSize=[xs(1.6->#rem)]
        color=[xs(Theme.Colors.white->#hex)]
        display=[xs(#flex)]
        alignItems=[xs(#center)]
        justifyContent=[xs(#center)]
        borderRadius=[xs(3)]
        width=[xs(size)]
        height=[xs(size)]
        bgColor=[xs(Theme.Colors.blue->#hex)]>
        {name->String.charAt(0)->String.toUpperCase->s}
      </Base>
    | Some(src) =>
      <Base tag=#img borderRadius=[xs(3)] width=[xs(4.8->#rem)] height=[xs(4.8->#rem)] src />
    }}
  </Box>
}
