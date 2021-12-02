module Colors2 = {
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
}

module Palette = {
  type t<'colorType> = {
    "50": 'colorType,
    "100": 'colorType,
    "200": 'colorType,
    "300": 'colorType,
    "400": 'colorType,
    "500": 'colorType,
  }

  type raw = t<string>

  type ancestor = t<Ancestor_CssTypes.Color.t>

  external toDict: ancestor => Js.Dict.t<Ancestor_CssTypes.Color.t> = "%identity"

  external colorsFromDict: Js.Dict.t<string> => raw = "%identity"

  let unwrap = colors => {
    let keys = Js.Obj.keys(colors)
    let dict = toDict(colors)
    let newColors = Js.Dict.empty()

    keys->Js.Array2.forEach(key => {
      let color = Js.Dict.unsafeGet(dict, key)
      Js.Dict.set(newColors, key, AncestorConduit.Color.toString(color))
    })

    colorsFromDict(newColors)
  }
}

module TypedColors = {
  let primary: Palette.ancestor = {
    "50": "#EBF0FF"->#hex,
    "100": "#C5D5FF"->#hex,
    "200": "#7A9FFF"->#hex,
    "300": "#5786FF"->#hex,
    "400": "#2C63F0"->#hex,
    "500": "#0B44D9"->#hex,
  }

  let neutral: Palette.ancestor = {
    "50": "#ECEEF5"->#hex,
    "100": "#D7DBEA"->#hex,
    "200": "#AEB3C9"->#hex,
    "300": "#8F94AC"->#hex,
    "400": "#656A84"->#hex,
    "500": "#282C3C"->#hex,
  }

  let negative: Palette.ancestor = {
    "50": "#FFD4E1"->#hex,
    "100": "#FFA7C1"->#hex,
    "200": "#F86591"->#hex,
    "300": "#EC336B"->#hex,
    "400": "#DA1E56"->#hex,
    "500": "#656A84"->#hex,
  }

  let background = #hex("#FAFAFA")
  let white = #hex("#FFFFFF")
}

module Colors = {
  let primary: Palette.raw = Palette.unwrap(TypedColors.primary)
  let neutral: Palette.raw = Palette.unwrap(TypedColors.neutral)
  let negative: Palette.raw = Palette.unwrap(TypedColors.negative)

  let background = TypedColors.white->AncestorConduit.Color.toString
  let white = TypedColors.white->AncestorConduit.Color.toString
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
