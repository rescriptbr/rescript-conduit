@module("react-use")
external useMedia: (string, bool) => bool = "useMedia"

type breakpoints = [#xs | #sm | #md | #lg | #xl]

type devices = {
  xs: bool,
  sm: bool,
  md: bool,
  lg: bool,
  xl: bool,
}

let valueOfBreakpoint = values =>
  switch values {
  | #xs => 0
  | #sm => 475
  | #md => 840
  | #lg => 1280
  | #xl => 1440
  }

let createMatchMedia = device => `(min-width: ${device->valueOfBreakpoint->Js.Int.toString})`

let useDevice = () => {
  let xs = useMedia(createMatchMedia(#xs), true)
  let sm = useMedia(createMatchMedia(#sm), true)
  let md = useMedia(createMatchMedia(#md), true)
  let lg = useMedia(createMatchMedia(#lg), false)
  let xl = useMedia(createMatchMedia(#xl), false)

  let device = switch (xs, sm, md, lg, xl) {
  | (true, false, false, false, false) => #xs
  | (_, true, false, false, false) => #sm
  | (_, _, true, false, false) => #md
  | (_, _, _, true, false) => #lg
  | (_, _, _, _, true) => #xl
  | _ => #xxs
  }

  (
    device,
    {
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
    },
  )
}
