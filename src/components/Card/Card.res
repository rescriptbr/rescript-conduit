open CssJs

let card = style(. [
  background(Theme.Colors.lightBlue1->hex),
  borderRadius(Theme.Radius.medium),
  padding(3.2->rem),
])

@react.component
let make = (~children) => {
  <div className={card}> children </div>
}
