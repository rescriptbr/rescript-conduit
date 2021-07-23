let button = (~block) =>
  Emotion.css({
    "background": Theme.Colors.blue,
    "border": 0,
    "color": Theme.Colors.white,
    "minWidth": block ? "100%" : "20rem",
    "height": "5.5rem",
    "borderRadius": Theme.Radius.small,
    "cursor": "pointer",
    "fontFamily": Theme.fontFamily,
    "fontSize": "2.0rem",
  })

@react.component
let make = (~children, ~className="", ~block=false, ~onClick=?) =>
  <button ?onClick className={`${className} ${button(~block)}`}> children </button>
