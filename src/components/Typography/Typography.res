open TypographyStyles

type level = [#1 | #2 | #3 | #4 | #5 | #6]
type body = [#1 | #2 | #3]
type textTags = [#p | #span | #div]

module Title = {
  @react.component
  let make = (
    ~level: level=#1,
    ~align=#left,
    ~color=Theme.Colors.black,
    ~noMargin=false,
    ~className as customClass="",
    ~children,
  ) => {
    let className = React.useMemo4(() => {
      let className = title(~level, ~align, ~color, ~noMargin)
      `${className} ${customClass}`
    }, (level, align, color, noMargin))

    switch level {
    | #1 => <h1 className> children </h1>
    | #2 => <h2 className> children </h2>
    | #3 => <h3 className> children </h3>
    | #4 => <h4 className> children </h4>
    | #5 => <h5 className> children </h5>
    | #6 => <h6 className> children </h6>
    }
  }
}

module Paragraph = {
  @react.component
  let make = (
    ~level: body=#1,
    ~noMargin=false,
    ~align=#left,
    ~color: string=Theme.Colors.gray1,
    ~children,
  ) => {
    <p className={paragraph(~level, ~align, ~color, ~noMargin)}> children </p>
  }
}
