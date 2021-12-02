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
    "display": "flex",
    "cursor": "pointer",
    "alignItems": "center",
    "justifyContent": "center",
    "height": "2.8rem",
    "width": "2.8rem",
    "margin": "0 0.6rem",
    "fontSize": "1.6rem",
    "color": Theme.Colors.neutral["200"],
    "borderRadius": Theme.Radius.small,
    "&:hover": {
      "transition": "300ms",
      "color": Theme.Colors.white,
      "backgroundColor": Theme.Colors.primary["100"],
    },
  })

  let activePageItem = css({
    "backgroundColor": Theme.Colors.primary["400"],
    "color": Theme.Colors.white,
    "&:hover": {
      "transition": "300ms",
      "color": Theme.Colors.white,
      "backgroundColor": Theme.Colors.primary["500"],
    },
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
      "cursor": "not-allowed",
      "&:hover": {
        "background": Theme.Colors.primary["100"],
      },
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
  type onPageChangeEvent = {selected: int}
  @react.component @module("react-paginate")
  external make: (
    ~forcePage: int,
    ~className: string,
    ~onPageChange: onPageChangeEvent => unit,
    ~onPageActive: 'a => unit=?,
    ~pageLinkClassName: string,
    ~activeLinkClassName: string,
    ~breakLabel: React.element,
    ~breakLinkClassName: string,
    ~nextLabel: React.element,
    ~pageCount: int,
    ~previousLabel: React.element,
    ~pageRangeDisplayed: int,
    ~renderOnZeroPageCount: React.element,
  ) => React.element = "default"
}

@react.component
let make = (~limit, ~count, ~activePage, ~onPageChange) => {
  let pageCount = Js.Math.ceil_int(count->Js.Int.toFloat /. limit->Js.Int.toFloat)

  <ReactPaginate
    className=Styles.container
    previousLabel={<PageButton disabled={activePage === 0} icon=module(Icons.ChevronLeft) />}
    nextLabel={<PageButton
      disabled={activePage === pageCount - 1} icon=module(Icons.ChevronRight)
    />}
    breakLabel={`...`->s}
    breakLinkClassName=Styles.pageItem
    pageLinkClassName=Styles.pageItem
    activeLinkClassName=Styles.activePageItem
    pageCount
    onPageChange
    pageRangeDisplayed={3}
    forcePage=activePage
    renderOnZeroPageCount={React.null}
  />
}

type pagination = {
  offset: int,
  limit: int,
}

let usePagination = (~offset=0, ~limit=20, ()) => {
  let (pagination, setState) = React.useState(_ => {offset: offset, limit: limit})

  let handleChangePage = (event: ReactPaginate.onPageChangeEvent) => {
    setState(pagination => {
      ...pagination,
      offset: event.selected,
    })
  }
  (pagination, handleChangePage)
}
