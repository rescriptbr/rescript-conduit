module Colors = {
  let blue = "477BFF"
  let white = "fff"
  let gray1 = "A6AABE"
  let gray2 = "AEB3C9"
  let black = "14103D"
  let lightBlue1 = "E2EAFF"
}

module Radius = {
  open CssJs

  let small = 6->px
  let medium = 12->px
  let large = 16->px
}

module Spacing = {
  open CssJs

  let xs = 0.8->rem
}

let fontFamily = #custom("'DM Sans', sans-serif")
