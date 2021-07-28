@module("./js/media-helpers")
external maxWidth: (string, {..}) => {..} = "maxWidth"

@module("./js/media-helpers")
external minWidth: (string, {..}) => {..} = "minWidth"

@module("react-use")
external useMedia: (string, bool) => bool = "useMedia"

type t = [#xxs | #xs | #sm | #md | #lg | #xl]

type device = {
  xxs: bool,
  xs: bool,
  sm: bool,
  md: bool,
  lg: bool,
  xl: bool,
}

let empty = Js.Obj.empty()

let valueOfDevice = value =>
  switch value {
  | #xxs => "0px"
  | #xs => "470px"
  | #sm => "600px"
  | #md => "960px"
  | #lg => "1280px"
  | #xl => "1920px"
  }

let lessThan = (values, device: t, styles) =>
  Js.Obj.assign(values, maxWidth(device->valueOfDevice, styles))

let greaterThan = (values, device: t, styles) =>
  Js.Obj.assign(values, minWidth(device->valueOfDevice, styles))

let xxs = lessThan(_, #xs)
let xs = lessThan(_, #sm)
let sm = lessThan(_, #md)
let md = lessThan(_, #lg)
let lg = lessThan(_, #xl)
let xl = greaterThan(_, #xl)

module Raw = {
  let greaterThan = (current, device, styles) =>
    `
  ${current}
  @media (min-width: ${device->valueOfDevice}) {
    ${styles}
  }
  `

  let lessThan = (current, device, styles) =>
    `
  ${current}
  @media (max-width: ${device->valueOfDevice}) {
    ${styles}
  }
  `
}

let createMatchMedia = device => `(min-width: ${device->valueOfDevice})`

let useDevice = () => {
  let xxs = useMedia(createMatchMedia(#xxs), true)
  let xs = useMedia(createMatchMedia(#xs), true)
  let sm = useMedia(createMatchMedia(#sm), true)
  let md = useMedia(createMatchMedia(#md), true)
  let lg = useMedia(createMatchMedia(#lg), false)
  let xl = useMedia(createMatchMedia(#xl), false)

  let device = switch (xxs, xs, sm, md, lg, xl) {
  | (true, false, false, false, false, false) => #xxs
  | (_, true, false, false, false, false) => #xs
  | (_, _, true, false, false, false) => #sm
  | (_, _, _, true, false, false) => #md
  | (_, _, _, _, true, false) => #lg
  | (_, _, _, _, _, true) => #xl
  | _ => #xxs
  }

  (
    device,
    {
      xxs: xxs,
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
    },
  )
}
