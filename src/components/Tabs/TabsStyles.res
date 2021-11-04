open Emotion

let tabs = css({
  "display": "flex",
  "margin": 0,
  "padding": 0,
})

let tab = (~active) =>
  css({
    "listStyle": "none",
    "> button": {
      "fontSize": "2.0rem",
      "transition": "200ms color",
      "padding": `${Theme.Spacing.make(1.)} ${Theme.Spacing.make(2.)}`,
      "borderRadius": Theme.Radius.small,
      "background": active ? Theme.Colors.blueGradient : "transparent",
      "color": active ? Theme.Colors.white : Theme.Colors.gray1,
      "border": "none",
      "fontFamily": Theme.fontFamily,
      "cursor": "pointer",
    },
    "&:hover": {
      "> button": {
        "transition": "200ms color",
        "color": active ? Theme.Colors.white : Theme.Colors.blue,
      },
    },
  })
