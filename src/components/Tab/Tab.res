open Render

module Styles = Tab_Styles

@react.component
let make = (~children) =>
  <div className=Styles.tab>
    children
  </div>

module Pane = {
  @react.component
  let make = (~children) =>
    <div className=Styles.pane>
      <Typography>{"Title"->s}</Typography>
      children
    </div>
}

module Content = {
  @react.component
  let make = (~children, ~pane) =>
    <div>
      children
    </div>
}
