module Colors = {
  let blue = "#477BFF"
  let white = "#fff"
  let gray1 = "#A6AABE"
  let gray2 = "#AEB3C9"
  let black = "#14103D"
  let lightBlue1 = "#E2EAFF"
  let blueGradient = "linear-gradient(180.0deg, 0 #477BFF, 100% #306AFF)"
}

module Radius = {
  let small = "6px"
  let medium = "12px"
  let large = "16px"
}

module Spacing = {
  let make = (value: int) => value->Js.Int.toFloat->(v => v *. 0.6)->Js.Float.toString ++ "rem"
}

let fontFamily = #custom("'DM Sans', sans-serif")
