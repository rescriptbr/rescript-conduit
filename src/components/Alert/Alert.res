open AncestorConduit

type variant = [#success | #info | #error]

@react.component
let make = (~variant as _: variant=#error, ~visible=false, ~children) => {
  <Box overflow=[xs(#hidden)]>
    <FramerMotion.AnimatePresence>
      {switch visible {
      | false => React.null
      | true =>
        <FramerMotion.Element
          initial={"opacity": 0, "y": 20} animate={"opacity": 1, "y": 0} exit={"opacity": 0}>
          <Box
            border=[xs((2->#px, #solid, Theme.TypedColors.negative["400"]))]
            bgColor=[xs(Theme.TypedColors.negative["200"])]
            px=[xs(3)]
            py=[xs(3)]
            borderRadius=[xs(2)]>
            <Text
              fontWeight=[xs(#700)]
              fontSize=[xs(1.6->#rem)]
              color=[xs(Theme.TypedColors.negative["400"])]>
              {children}
            </Text>
          </Box>
        </FramerMotion.Element>
      }}
    </FramerMotion.AnimatePresence>
  </Box>
}
