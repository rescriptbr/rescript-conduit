open Render
open AncestorConduit

module Styles = {
  open Emotion.Raw

  let input = (~error) =>
    css(
      `
    height: 5.6rem;
    width: 100%;
    background: ${Theme.Colors.lightBlue1};
    font-size: 2.0rem;
    border-style: none;
    border-radius: ${Theme.Radius.small};
    padding: 0 ${Theme.Spacing.make(3.)};
    box-sizing: border-box;
    color: ${Theme.Colors.black};
    outline-style: none;
    transition: 300ms;
    &:focus {
      transition: 300ms;
      box-shadow: ${switch error {
        | None => `0px 0px 0px 2px ${Theme.Colors.blue}`
        | Some(_) => ""
        }};
    }

    box-shadow: ${switch error {
        | None => "none"
        | Some(_) => `0px 0px 0px 2px ${Theme.Colors.red}`
        }};

    &::placeholder: {
      color: ${Theme.Colors.gray2};
    }
  `,
    )
}

@react.component
let make = (
  ~placeholder=?,
  ~name=?,
  ~onBlur=?,
  ~onChange=?,
  ~error=None,
  ~type_=?,
  ~label=?,
  ~disabled=?,
) => {
  <Base width=[xs(100.->#pct)]>
    {switch label {
    | Some(label) =>
      <Base
        tag=#label
        fontSize=[xs(2.->#rem)]
        color=[xs(Theme.Colors.Ancestor.black)]
        display=[xs(#block)]
        mb=[xs(1)]>
        {label->s}
      </Base>
    | None => React.null
    }}
    <input ?disabled ?type_ ?placeholder ?name ?onBlur ?onChange className={Styles.input(~error)} />
    {switch error {
    | None => React.null
    | Some(message) =>
      <Base
        tag=#span
        color=[xs(Theme.Colors.Ancestor.red)]
        fontWeight=[xs(#600)]
        fontSize=[xs(1.20->#rem)]
        display=[xs(#block)]
        mt=[xs(1)]>
        {message->s}
      </Base>
    }}
  </Base>
}
