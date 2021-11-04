open Emotion

module Styles = {
  let link = css({
    "fontFamily": Theme.fontFamily,
    "color": Theme.Colors.blue,
    "fontSize": "2.0rem",
    "position": "relative",
    "cursor": "pointer",
    "zIndex": 1,
    "background": "transparent",
    "transition": "100ms color",
    "padding": "2px",
    "textDecoration": "none",
    "&:after": {
      "zIndex": -1,
      "content": `" "`,
      "height": "2px",
      "width": "100%",
      "background": Theme.Colors.blue,
      "position": "absolute",
      "bottom": "-1px",
      "left": 0,
      "transition": "100ms height",
    },
    "&:hover": {
      "transition": "100ms color",
      "color": Theme.Colors.white,
      "&:after": {"transition": "100ms height", "height": "100%"},
    },
  })

  let unstyled = css({
    "textDecoration": "none",
    "border": "0",
  })
}

@react.component
let make = (~to_: Router.routes, ~children) => {
  let href = to_->Router.toString
  let handleClick = event => {
    event->ReactEvent.Mouse.preventDefault
    to_->Router.toString->RescriptReactRouter.push
  }

  <a href onClick=handleClick className={Styles.link}> children </a>
}

module Unstyled = {
  @react.component
  let make = (~to_: Router.routes, ~children) => {
    let href = to_->Router.toString
    let handleClick = event => {
      event->ReactEvent.Mouse.preventDefault
      to_->Router.toString->RescriptReactRouter.push
    }

    <a href onClick=handleClick className={Styles.unstyled}> children </a>
  }
}
