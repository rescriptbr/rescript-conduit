open Render

module Styles = {
  open CssJs

  let label = style(.[
    fontSize(2.0->rem),
    color(Theme.Colors.black->hex),
    fontFamily(Theme.fontFamily),
    display(block),
    marginBottom(0.8->rem),
  ])

  let input = style(.[
    height(5.6->rem),
    width(100.0->pct),
    background(`E2EAFF`->hex),
    fontFamily(Theme.fontFamily),
    fontSize(2.0->rem),
    borderStyle(none),
    borderRadius(Theme.Radius.small),
    padding2(~v=zero, ~h=2.4->rem),
    boxSizing(borderBox),
    color(Theme.Colors.black->hex),
    outlineStyle(none),
    placeholder([color(Theme.Colors.gray2->hex)]),
  ])
}
@react.component
let make = (~placeholder=?, ~name=?, ~onChange=?, ~type_=?, ~label=?) => {
  <div>
    {switch label {
    | Some(label) => <label className={Styles.label}> {label->s} </label>
    | None => React.null
    }}
    <input ?type_ ?placeholder ?name ?onChange className={Styles.input} />
  </div>
}
