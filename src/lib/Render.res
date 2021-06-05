let s = React.string

let map = (elements, fn) =>
  elements
  ->Belt.Array.mapWithIndex((key, element) => fn(element, key->Belt.Int.toString))
  ->React.array
