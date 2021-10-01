type variant = [#default | #white]

let logo = Emotion.css({
  "width": "100%",
})

@react.component
let make = (~variant: variant=#default) => {
  <div className="container">
    <img
      className=logo
      src={switch variant {
      | #default => Assets.logo
      | #white => Assets.logoWhite
      }}
      alt="Logo"
    />
  </div>
}
