type variant = [#title | #text]
type level = [#h1 | #h2]

module Styles = {
  open CssJs

  let h1 = style(.[
    fontSize(3.2->rem),
    fontFamily(Theme.fontFamily),
    fontWeight(#bold),
    color(Theme.Colors.black->hex),
  ])

  let h2 = style(.[
    fontSize(2.8->rem),
    fontFamily(Theme.fontFamily),
    fontWeight(#bold),
    color(Theme.Colors.black->hex),
  ])

  let text = style(.[
    fontSize(2.0->rem),
    fontFamily(Theme.fontFamily),
    letterSpacing(-0.02->em),
    color(Theme.Colors.gray1->hex),
  ])
}

@react.component
let make = (~variant=#text, ~level: level=#h1, ~children) => {
  switch (variant, level) {
  | (#title, #h1) => <h1 className={Styles.h1}> children </h1>
  | (#title, #h2) => <h2 className={Styles.h2}> children </h2>
  | (#text, _) => <p className={Styles.text}> children </p>
  }
}
