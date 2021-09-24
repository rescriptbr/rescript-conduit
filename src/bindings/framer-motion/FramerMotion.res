module MotionValue = {
  type t<'value>
  @send external onChange: (t<'value>, 'value => unit) => unit = "onChange"
}

@module("framer-motion") external motion: {..} = "motion"

@module("framer-motion")
external useViewportScroll: unit => {
  "scrollX": MotionValue.t<float>,
  "scrollY": MotionValue.t<float>,
  "scrollXProgress": MotionValue.t<float>,
  "scrollYProgress": MotionValue.t<float>,
  "onChange": 'any,
} = "useViewportScroll"

@module("framer-motion")
external useTransform: (MotionValue.t<'value>, 'a, 'b) => MotionValue.t<'value> = "useTransform"

@module("framer-motion")
external useTransformWithCallback: (
  MotionValue.t<'value>,
  'value => 'value,
) => MotionValue.t<'value> = "useTransform"

@module("framer-motion")
external useMotionValue: 'value => MotionValue.t<'value> = "useMotionValue"

module Animations = {
  type controls

  @module("framer-motion")
  external useAnimation: unit => controls = "useAnimation"

  @send external start: controls => Js.Promise.t<unit> = "start"

  @send external startSync: (controls, 'a) => unit = "start"
}

module Element = {
  type motionElement
  type tags = [
    | #div
    | #section
    | #ul
    | #li
    | #img
    | #button
    | #h1
    | #h2
    | #h3
    | #h4
    | #h5
    | #h6
  ]

  let getElementByTag = element =>
    switch element {
    | #div => motion["div"]
    | #section => motion["section"]
    | #ul => motion["ul"]
    | #li => motion["li"]
    | #img => motion["img"]
    | #button => motion["button"]
    | #h1 => motion["h1"]
    | #h2 => motion["h2"]
    | #h3 => motion["h3"]
    | #h4 => motion["h4"]
    | #h5 => motion["h5"]
    | #h6 => motion["h6"]
    }

  @module("react")
  external createElement: (motionElement, {..}, option<React.element>) => React.element =
    "createElement"

  @react.component
  let make = (
    ~tag as element: tags=#div,
    ~initial=?,
    ~animate=?,
    ~exit=?,
    ~variants=?,
    ~style=?,
    ~transition=?,
    ~className: option<string>=?,
    ~src: option<string>=?,
    ~children=?,
    ~innerRef=?,
  ) => {
    createElement(
      getElementByTag(element),
      {
        "initial": initial,
        "animate": animate,
        "exit": exit,
        "variants": variants,
        "transition": transition,
        "style": style,
        "className": className,
        "src": src,
        "ref": innerRef,
      },
      children,
    )
  }
}

module AnimatePresence = {
  @react.component @module("framer-motion")
  external make: (~children: React.element, ~initial: bool=?) => React.element = "AnimatePresence"
}
