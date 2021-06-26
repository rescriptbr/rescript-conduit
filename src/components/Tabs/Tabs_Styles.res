open CssJs
open Emotion

let tabs = css({
  "display": "flex",
  "margin": 0,
  "padding": 0,
})

let tabs_ = style(. [display(#flex), margin(zero), padding(zero)])

let tab = (~active) =>
  css({
    "listStyle": "none",
    "> button": {
      "transition": "200ms color",
      "padding": `${Theme.Spacing.make(1)} ${Theme.Spacing.make(2)}`,
      "borderRadius": Theme.Radius.small,
      "color": active ? Theme.Colors.white : Theme.Colors.gray1,
      "border": "none",
    },
  })

let tab_ = (~active) =>
  style(. [
    listStyleType(none),
    selector(
      "> button",
      [
        transition(~duration=200, "color"),
        // padding2(~v=Theme.Spacing.make(1), ~h=Theme.Spacing.make(2)),
        // borderRadius(Theme.Radius.small),
        // background(active ? Theme.Colors.blueGradient : transparent),
        color(active ? Theme.Colors.white->hex : Theme.Colors.gray1->hex),
        borderStyle(none),
        fontFamily(Theme.fontFamily),
        cursor(pointer),
      ],
    ),
    hover([
      selector(
        "> button",
        [
          transition(~duration=200, "color"),
          color(active ? Theme.Colors.white->hex : Theme.Colors.blue->hex),
        ],
      ),
    ]),
  ])
