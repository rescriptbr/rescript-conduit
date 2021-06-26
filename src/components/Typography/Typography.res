type variant = [#title | #text]
type level = [#1 | #2]

module Styles = {
  open Emotion

  let h1 = css({
    "fontSize": "3.2rem",
    "fontFamily": Theme.fontFamily,
    "fontWeight": "bold",
    "color": Theme.Colors.black,
  })

  let h2 = css({
    "fontSize": "2.8rem",
    "fontFamily": Theme.fontFamily,
    "fontWeight": "bold",
    "color": Theme.Colors.black,
  })

  let text = css({
    "fontSize": "2.0rem",
    "fontFamily": Theme.fontFamily,
    "letterSpacing": "-0.02em",
    "color": Theme.Colors.gray1,
  })
}

@react.component
let make = (~variant=#text, ~level: level=#1, ~children) => {
  switch (variant, level) {
  | (#title, #1) => <h1 className={Styles.h1}> children </h1>
  | (#title, #2) => <h2 className={Styles.h2}> children </h2>
  | (#text, _) => <p className={Styles.text}> children </p>
  }
}
