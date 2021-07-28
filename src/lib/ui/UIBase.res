open! UICore

let toFloat = value =>
  switch value {
  | #1 => 1.0
  | #2 => 2.0
  | #3 => 3.0
  | #4 => 4.0
  | #5 => 5.0
  | #6 => 6.0
  | #7 => 7.0
  | #8 => 8.0
  | #9 => 9.0
  | #10 => 10.0
  | #11 => 11.0
  | #12 => 12.0
  | _ => 12.0
  }

let flexBasis = maybeValue =>
  maybeValue
  ->Belt.Option.map(value => {
    let flexBasisValue = switch value {
    | #auto => "auto"
    | numericValue =>
      `${(numericValue->toFloat /. 12.0 *. 100.0)->Js.Float.toFixedWithPrecision(~digits=1)}%`
    }

    `flex-basis: ${flexBasisValue};`
  })
  ->Belt.Option.getWithDefault("")

let box = (~xxs=?, ~xs=?, ~sm=?, ~md=?, ~lg=?, ~xl=?, ()) =>
  Emotion.Raw.css(
    ""
    ->Devices.Raw.greaterThan(#xxs, flexBasis(xxs))
    ->Devices.Raw.greaterThan(#xs, flexBasis(xs))
    ->Devices.Raw.greaterThan(#sm, flexBasis(sm))
    ->Devices.Raw.greaterThan(#md, flexBasis(md))
    ->Devices.Raw.greaterThan(#lg, flexBasis(lg))
    ->Devices.Raw.greaterThan(#xl, flexBasis(xl)),
  )

@react.component
let make = (
  // Flex
  ~display=?,
  ~justifyContent=?,
  ~flexDirection=?,
  ~alignItems=?,
  // Padding
  ~p=?,
  ~px=?,
  ~py=?,
  ~pt=?,
  ~pb=?,
  ~pl=?,
  ~pr=?,
  //Margin
  ~m=?,
  ~mx=?,
  ~my=?,
  ~mt=?,
  ~mb=?,
  ~ml=?,
  ~mr=?,
  // Columns,
  ~xxs=?,
  ~xs=?,
  ~sm=?,
  ~md=?,
  ~lg=?,
  ~xl=?,
  // Sizing
  ~width=?,
  ~height=?,
  // Position
  ~position=?,
  ~top=?,
  ~bottom=?,
  ~left=?,
  ~right=?,
  // Props
  ~children,
  ~tag: tags=#div,
  ~className="",
) =>
  createElement(
    tag,
    {
      "children": children,
      "className": `${box(
          ~xxs?,
          ~xs?,
          ~sm?,
          ~md?,
          ~lg?,
          ~xl?,
          (),
        )} ${className} ${UIResponsive.make(
          ~display?,
          ~justifyContent?,
          ~flexDirection?,
          ~alignItems?,
          ~p?,
          ~py?,
          ~px?,
          ~pt?,
          ~pb?,
          ~pl?,
          ~pr?,
          ~m?,
          ~mx?,
          ~my?,
          ~mt?,
          ~mb?,
          ~ml?,
          ~mr?,
          ~width?,
          ~height?,
          ~position?,
          ~top?,
          ~bottom?,
          ~left?,
          ~right?,
          (),
        )->Emotion.Raw.css}`,
    },
  )
