open AncestorConduit

module Option = Belt.Option

type size = [#sm | #lg]

module Styles = {
  open Emotion.Raw

  let button = (~block, ~loading, ~size) =>
    css(
      `
    background: ${Theme.Colors.blue};
    border: 0;
    color: ${Theme.Colors.white};
    min-width: ${block ? "100%" : "12rem"};
    height: ${switch size {
        | #lg => `5.5rem`
        | #sm => `4.2rem`
        }};
    border-radius: ${Theme.Radius.small};
    cursor: pointer;
    font-size: ${switch size {
        | #lg => `2.0rem`
        | #sm => `1.6rem`
        }};
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;

    &:hover {
      transition: 200ms;
      background: ${Theme.Colors.blue2};
    }

    &:disabled {
      cursor: ${loading ? `wait` : `not-allowed`};
      opacity: ${loading ? `0.8` : `0.5`};
    }
  `,
    )
}

@react.component
let make = (
  ~children,
  ~className="",
  ~to_: option<Router.routes>=?,
  ~block=false,
  ~onClick=?,
  ~loading=false,
  ~size: size=#lg,
  ~disabled=?,
) => {
  <Base
    tag={to_->Option.map(_ => #a)->Option.getWithDefault(#button)}
    href=?{to_->Option.map(Router.toString)}
    ?onClick
    className={`${className} ${Styles.button(~block, ~loading, ~size)}`}
    ?disabled>
    {switch loading {
    | true => <Base tag=#img width=[xs(3.2->#rem)] src=Assets.spinner />
    | false => children
    }}
  </Base>
}
