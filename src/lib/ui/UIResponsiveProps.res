external stringify: 'value => string = "%identity"

type breakpoints<'a> = [
  | #xxs('a)
  | #xs('a)
  | #sm('a)
  | #md('a)
  | #lg('a)
  | #xl('a)
]

type record = {
  xxs: option<string>,
  xs: option<string>,
  sm: option<string>,
  md: option<string>,
  lg: option<string>,
  xl: option<string>,
}

type values<'a> = array<breakpoints<'a>>

let empty = {
  xxs: None,
  xs: None,
  sm: None,
  md: None,
  lg: None,
  xl: None,
}

// Flex
type justifyContent = values<
  [
    | #initial
    | #"space-between"
    | #center
    | #"flex-start"
    | #"flex-end"
    | #"space-around"
    | #"space-evenly"
    | #start
    | #end
    | #left
    | #right
    | #revert
    | #unset
  ],
>

type alignItems = values<
  [
    | #initial
    | #center
    | #start
    | #end
    | #"flex-start"
    | #"flex-end"
    | #"self-start"
    | #"self-end"
  ],
>

type flexDirection = values<
  [
    | #row
    | #"row-reverse"
    | #column
    | #"column-reverse"
    | #inherit
    | #initial
    | #unset
  ],
>

// Texts
type textAlign = values<[#center | #left | #right]>

// General
type display = values<[#none | #block | #flex]>

// Spacing
type spacing = values<int>

let stringifySpacing = Theme.Spacing.make

// Sizing
type size = values<
  [
    | #pct(float)
    | #px(float)
    | #rem(float)
    | #em(float)
  ],
>

let stringifySize = size =>
  switch size {
  | #pct(value) => `${value->Js.Float.toString}%`
  | #px(value) => `${value->Js.Float.toString}px`
  | #rem(value) => `${value->Js.Float.toString}rem`
  | #em(value) => `${value->Js.Float.toString}rem`
  }

// Postion
type position = values<
  [
    | #static
    | #relative
    | #absolute
    | #fixed
    | #sticky
  ],
>
