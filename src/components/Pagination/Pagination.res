open Render

module Styles = {
  open Emotion

  let container = css({
    "display": "flex",
    "alignItems": "center",
    "margin": "0",
    "padding": "0",
    "listStyle": "none",
  })

  let pageItem = css({
    "border": "solid 1px red",
  })

  let pageButton = css({
    "background": Theme.Colors.primary["400"],
    "borderRadius": Theme.Radius.small,
    "border": "none",
    "padding": 0,
    "margin": 0,
    "height": "2.8rem",
    "width": "2.8rem",
    "display": "flex",
    "alignItems": "center",
    "justifyContent": "center",
    "cursor": "pointer",
    "transition": "300ms",
    "&:disabled": {
      "background": Theme.Colors.primary["100"],
    },
    "&:hover": {
      "background": Theme.Colors.primary["500"],
    },
  })
}

module PageButton = {
  @react.component
  let make = (~icon: module(Icons.Icon), ~disabled=false) => {
    let module(Icon) = icon
    <button disabled className={Styles.pageButton}> <Icon color=Theme.Colors.white /> </button>
  }
}

module ReactPaginate = {
  type event
  @react.component @module("react-paginate")
  external make: (
    ~className: string,
    ~onPageChange: event => unit,
    ~pageLinkClassName: string,
    ~breakLabel: React.element,
    ~pageCount: int,
    ~nextLabel: React.element,
    ~previousLabel: React.element,
    ~pageRangeDisplayed: int,
    ~renderOnZeroPageCount: React.element,
  ) => React.element = "default"
}

@react.component
let make = (~count, ~onPageChange) => {
  <ReactPaginate
    className=Styles.container
    previousLabel={<PageButton disabled=true icon=module(Icons.ChevronLeft) />}
    nextLabel={<PageButton icon=module(Icons.ChevronRight) />}
    breakLabel={`...`->s}
    pageLinkClassName=Styles.pageItem
    pageCount={count}
    onPageChange
    pageRangeDisplayed={3}
    renderOnZeroPageCount={React.null}
  />
}
