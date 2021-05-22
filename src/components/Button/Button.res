open CssJs

  style(.[
  display(#flexx)
])

let button = (~block) =>
  style(.[
    background(Theme.Colors.blue->hex),
    borderStyle(none),
    color(Theme.Colors.white->hex),
    height(5.5->rem),
    minWidth(block ? 100.0->pct : 20.0->rem),
    borderRadius(Theme.Radius.small),
    cursor(pointer),
    fontFamily(Theme.fontFamily),
    fontSize(2.0->rem),
  ])

@react.component
let make = (~children, ~block=false, ~onClick) =>
  <button onClick className={button(~block)}> children </button>
