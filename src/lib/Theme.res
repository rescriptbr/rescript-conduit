module Colors = {
  open CssJs

  let blue = "477BFF"
  let white = "fff"
  let gray1 = "A6AABE"
  let gray2 = "AEB3C9"
  let black = "14103D"
  let lightBlue1 = "E2EAFF"
  let blueGradient = linearGradient(
    180.0->deg,
    list{(0.0->pct, "477BFF"->hex), (100.0->pct, "306AFF"->hex)},
  )
}

module Radius = {
  open CssJs

  let small = 6->px
  let medium = 12->px
  let large = 16->px
}

module Spacing = {
  open CssJs
  let make = (value: int) => value->Js.Int.toFloat->(v => v *. 0.6)->rem
}

let fontFamily = #custom("'DM Sans', sans-serif")
