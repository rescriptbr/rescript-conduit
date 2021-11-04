type variant = [#default | #white | #minimal]

let logo = Emotion.css({
  "width": "100%",
})

@react.component
let make = (~variant: variant=#default) => {
  <Link.Unstyled to_=Home>
    <div className="container">
      <img
        className=logo
        src={switch variant {
        | #default => Assets.logo
        | #white => Assets.logoWhite
        | #minimal => Assets.logoMinimal
        }}
        alt="Logo"
      />
    </div>
  </Link.Unstyled>
}
