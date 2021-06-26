open Emotion

let link = css({
  "fontFamily": Theme.fontFamily,
  "color": Theme.Colors.blue,
  "fontSize": "2.0rem",
  "position": "relative",
  "cursor": "pointer",
  "zIndex": 1,
  "background": "transparent",
  "transition": "100ms color",
  "padding": "2px",
  "&:after": {
    "zIndex": -1,
    "content": " ",
    "height": "2px",
    "width": "100%",
    "background": Theme.Colors.blue,
    "position": "absolute",
    "bottom": "-3px",
    "left": 0,
    "transition": "100ms height",
  },
  "&:hover": {
    "transition": "100ms color",
    "color": Theme.Colors.white,
    "&:after": {"transition": "100ms height", "height": "100%"},
  },
})

@react.component
let make = (~href=?, ~children) => {
  <a ?href className={link}> children </a>
}
