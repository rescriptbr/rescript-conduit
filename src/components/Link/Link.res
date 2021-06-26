let link = {
  open CssJs

  style(.[
    // fontFamily(Theme.fontFamily),
    color(Theme.Colors.blue->hex),
    fontSize(2.0->rem),
    position(relative),
    cursor(pointer),
    zIndex(1),
    background(transparent),
    transition("color", ~duration=100),
    padding(2->px),
    after([
      zIndex(-1),
      contentRule(" "->#text),
      height(2->px),
      width(100.0->pct),
      background(Theme.Colors.blue->hex),
      position(absolute),
      bottom(-3->px),
      left(zero),
      transition("height", ~duration=100),
    ]),
    hover([
      transition("color", ~duration=100),
      color(Theme.Colors.white->hex),
      after([transition("height", ~duration=100), height(100.0->pct)]),
    ]),
  ])
}

@react.component
let make = (~href=?, ~children) => {
  <a ?href className={link}> children </a>
}
