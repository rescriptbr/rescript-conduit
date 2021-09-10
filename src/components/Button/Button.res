open AncestorConduit

module Styles = {
  open Emotion.Raw

  let button = (~block, ~loading) =>
    css(
      `
    background: ${Theme.Colors.blue};
    border: 0;
    color: ${Theme.Colors.white};
    min-width: ${block ? "100%" : "20rem"};
    height: 5.5rem;
    border-radius: ${Theme.Radius.small};
    cursor: pointer;
    font-size: 2.0rem;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &:disabled {
      cursor: ${loading ? `wait` : `not-allowed`};
      opacity: ${loading ? `0.8` : `0.5`};
    }
  `,
    )
}

@react.component
let make = (~children, ~className="", ~block=false, ~onClick=?, ~loading=false, ~disabled=?) =>
  <button ?onClick className={`${className} ${Styles.button(~block, ~loading)}`} ?disabled>
    {switch loading {
    | true => <Base tag=#img width=[xs(3.2->#rem)] src=Assets.spinner />
    | false => children
    }}
  </button>
