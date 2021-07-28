open Render

module Styles = {
  open Emotion

  let wrapper = css({
    "width": "100%",
  })

  let label = css({
    "fontSize": "2.0rem",
    "color": Theme.Colors.black,
    "fontFamily": Theme.fontFamily,
    "display": "block",
    "marginBottom": "0.8rem",
  })

  let input = css({
    "height": "5.6rem",
    "width": "100%",
    "background": Theme.Colors.lightBlue1,
    "font": `2.0rem ${Theme.fontFamily}`,
    "borderStyle": "none",
    "borderRadius": Theme.Radius.small,
    "padding": "0 2.4rem",
    "boxSizing": "border-box",
    "color": Theme.Colors.black,
    "outlineStyle": "none",
    "&::placeholder": {
      "color": Theme.Colors.gray2,
    },
  })
}
@react.component
let make = (~placeholder=?, ~name=?, ~onChange=?, ~type_=?, ~label=?) => {
  <div className={Styles.wrapper}>
    {switch label {
    | Some(label) => <label className={Styles.label}> {label->s} </label>
    | None => React.null
    }}
    <input ?type_ ?placeholder ?name ?onChange className={Styles.input} />
  </div>
}
