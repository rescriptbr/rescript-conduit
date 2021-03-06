open AncestorConduit
open Render

module Styles = Input_Styles

@react.component
let make = (
  ~placeholder=?,
  ~name=?,
  ~onBlur=?,
  ~onChange=?,
  ~error=None,
  ~label=?,
  ~disabled=?,
) => {
  <Base width=[xs(100.->#pct)]>
    {switch label {
    | Some(label) =>
      <Base
        tag=#label
        fontSize=[xs(2.->#rem)]
        color=[xs(Theme.TypedColors.neutral["500"])]
        display=[xs(#block)]
        mb=[xs(1)]>
        {label->s}
      </Base>
    | None => React.null
    }}
    <textarea ?disabled ?placeholder ?name ?onBlur ?onChange className={Styles.textarea(~error)} />
    {switch error {
    | None => React.null
    | Some(message) =>
      <Base
        tag=#span
        color=[xs(Theme.TypedColors.negative["500"])]
        fontWeight=[xs(#600)]
        fontSize=[xs(1.20->#rem)]
        display=[xs(#block)]
        mt=[xs(1)]>
        {message->s}
      </Base>
    }}
  </Base>
}
