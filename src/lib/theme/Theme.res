module Colors = {
  let blue = "#477BFF"
  let blue2 = "#3163E2"
  let lightBlue1 = "#E2EAFF"
  let blueGradient = "linear-gradient(180deg, #477BFF 0%, #306AFF 100%);"

  let red = "#EC336B"
  let redLight = "#FACCDA"

  let gray1 = "#A6AABE"
  let gray2 = "#AEB3C9"

  let white = "#fff"
  let black = "#14103D"

  module Ancestor = {
    let blue = #hex(blue)
    let lightBlue1 = #hex(lightBlue1)

    let red = #hex(red)
    let redLight = #hex(redLight)

    let gray1 = #hex(gray1)
    let gray2 = #hex(gray2)

    let black = #hex(black)
    let white = #hex(white)
  }
}

module Radius = {
  let small = "6px"
  let medium = "12px"
  let large = "16px"
}

module Spacing = {
  let make = (value: float) => value->(v => v *. 0.8)->Js.Float.toString ++ "rem"
}

let fontFamily = "'DM Sans', sans-serif"
let wrapperMaxW = #rem(144.0)
