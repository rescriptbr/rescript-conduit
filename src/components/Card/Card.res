open Emotion

let card = css({
  "background": Theme.Colors2.lightBlue1,
  "borderRadius": Theme.Radius.medium,
  "padding": "3.2rem",
})

@react.component
let make = (~children) => {
  <div className={card}> children </div>
}
