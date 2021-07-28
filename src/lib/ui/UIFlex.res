open UICore

let flex = Emotion.Raw.css(`
  width: 100%;
  flex-wrap: wrap;
`)

let make = UIBase.make

let makeProps = (~className as customClass: string="") =>
  UIBase.makeProps(~display=[xxs(#flex)], ~className=`${flex} ${customClass}`)
