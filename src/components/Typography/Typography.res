type variant = [#title | #text]
type level = [#1 | #2]

let h1 = Emotion.css({
  "fontSize": "3.2rem",
  "fontFamily": Theme.fontFamily,
  "fontWeight": "bold",
  "color": Theme.Colors.black,
  "margin": 0,
  "marginBottom": Theme.Spacing.make(3),
})

let h2 = Emotion.css({
  "fontSize": "2.8rem",
  "fontFamily": Theme.fontFamily,
  "fontWeight": "bold",
  "color": Theme.Colors.black,
  "margin": 0,
  "marginBottom": Theme.Spacing.make(3),
})

let text = Emotion.css({
  "fontSize": "2.0rem",
  "fontFamily": Theme.fontFamily,
  "letterSpacing": "-0.02em",
  "color": Theme.Colors.gray1,
  "margin": 0,
  "marginBottom": Theme.Spacing.make(2),
})

@react.component
let make = (~variant=#text, ~level: level=#1, ~children) => {
  switch (variant, level) {
  | (#title, #1) => <h1 className={h1}> children </h1>
  | (#title, #2) => <h2 className={h2}> children </h2>
  | (#text, _) => <p className={text}> children </p>
  }
}
