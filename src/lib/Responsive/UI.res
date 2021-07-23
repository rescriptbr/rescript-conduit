type tags = [
  | #header
  | #div
  | #section
  | #ul
  | #li
  | #span
  | #footer
]

type columnSize = [
  | #auto
  | #1
  | #2
  | #3
  | #4
  | #5
  | #6
  | #7
  | #8
  | #9
  | #10
  | #11
  | #12
]

let responsiveStyles = Responsive.make

@module("react")
external createElement: (tags, {..}) => React.element = "createElement"

let min = v => [#xxs(v)]
let xxs = v => #xxs(v)
let xs = v => #xs(v)
let sm = v => #sm(v)
let md = v => #md(v)
let lg = v => #lg(v)
let xl = v => #xl(v)

module Box = {
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
    ->Belt.Option.map(value =>
      `
    flex-basis: ${switch value {
        | #auto => "auto"
        | numericValue =>
          `${(numericValue->toFloat /. 12.0 *. 100.0)->Js.Float.toFixedWithPrecision(~digits=1)}%`
        }};
    `
    )
    ->Belt.Option.getWithDefault("")

  let box = (~xxs=?, ~xs=?, ~sm=?, ~md=?, ~lg=?, ~xl=?, ()) =>
    Emotion.raw(
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
    // Props
    ~children,
    ~tag: tags=#div,
  ) =>
    createElement(
      tag,
      {
        "children": children,
        "className": Emotion.compose(
          box(~xxs?, ~xs?, ~sm?, ~md?, ~lg?, ~xl?, ()),
          responsiveStyles(
            // Flex
            ~display?,
            ~justifyContent?,
            ~flexDirection?,
            ~alignItems?,
            // Padding
            ~p?,
            ~py?,
            ~px?,
            ~pt?,
            ~pb?,
            ~pl?,
            ~pr?,
            // Margin
            ~m?,
            ~mx?,
            ~my?,
            ~mt?,
            ~mb?,
            ~ml?,
            ~mr?,
            (),
          ),
        ),
      },
    )
}

module Flex = {
  let flex = Emotion.raw(`
    width: 100%;
    flex-wrap: wrap;
  `)

  @react.component
  let make = (
    // Flex
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
    // Props
    ~children,
  ) =>
    <div
      className={Emotion.compose(
        flex,
        responsiveStyles(
          // Flex
          ~display=min(#flex),
          ~justifyContent?,
          ~flexDirection?,
          ~alignItems?,
          // Padding
          ~p?,
          ~py?,
          ~px?,
          ~pt?,
          ~pb?,
          ~pl?,
          ~pr?,
          // Margin
          ~m?,
          ~mx?,
          ~my?,
          ~mt?,
          ~mb?,
          ~ml?,
          ~mr?,
          (),
        ),
      )}>
      children
    </div>
}
