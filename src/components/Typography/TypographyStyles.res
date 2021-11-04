type align = [#center | #left | #right]

let title = (~level, ~color: string, ~align: align, ~noMargin) =>
  Emotion.css({
    "color": color,
    "fontFamily": Theme.fontFamily,
    "margin": noMargin ? "0" : `${Theme.Spacing.make(2.)} 0 0 0`,
    "textAlign": align,
    "fontSize": switch level {
    | #1 => "7.2rem"
    | #2 => "5.6rem"
    | #3 => "4.6rem"
    | #4 => "3.2rem"
    | #5 => "2.4rem"
    | #6 => "1.8rem"
    },
    "fontWeight": switch level {
    | #1 => 700
    | #2 => 700
    | #3 => 700
    | #4 => 700
    | #5 => 600
    | #6 => 500
    },
    "lineHeight": switch level {
    | #1 => "94px"
    | #2 => "73px"
    | #3 => "60px"
    | #4 => "42px"
    | #5 => "36px"
    | #6 => "24px"
    },
  })

let paragraph = (~level, ~align: align, ~color, ~noMargin) =>
  Emotion.css({
    "fontFamily": Theme.fontFamily,
    "fontWeight": 400,
    "lineHeight": switch level {
    | #1 => "3.2rem"
    | #2
    | #3 => "2.4rem"
    },
    "color": color,
    "textAlign": align,
    "margin": noMargin ? "0" : `${Theme.Spacing.make(2.)} 0 0 0`,
    "fontSize": switch level {
    | #1 => "2.4rem"
    | #2 => "2.0rem"
    | #3 => "1.6rem"
    },
  })
