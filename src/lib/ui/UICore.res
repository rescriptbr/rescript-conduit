type tags = [
  | #header
  | #div
  | #section
  | #ul
  | #li
  | #span
  | #footer
]

type columnSize = [
  | #auto
  | #1
  | #2
  | #3
  | #4
  | #5
  | #6
  | #7
  | #8
  | #9
  | #10
  | #11
  | #12
]

let all = v => [#xxs(v)]
let xxs = v => #xxs(v)
let xs = v => #xs(v)
let sm = v => #sm(v)
let md = v => #md(v)
let lg = v => #lg(v)
let xl = v => #xl(v)

@module("react")
external createElement: (tags, {..}) => React.element = "createElement"

let makeStyles = UIResponsive.make
