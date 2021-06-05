open CssJs

let tabs = style(. [display(#flex), margin(zero), padding(zero)])

let tab = (~active) =>
  style(. [
    listStyleType(none),
    selector(
      "> button",
      [
        transition(~duration=200, "color"),
        padding2(~v=Theme.Spacing.make(1), ~h=Theme.Spacing.make(2)),
        borderRadius(Theme.Radius.small),
        background(active ? Theme.Colors.blueGradient : transparent),
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
