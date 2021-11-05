open AncestorConduit

type variant = [#default | #white | #minimal]

@react.component
let make = (~variant: variant=#default) => {
  <Link.Unstyled to_=Home>
    <div className="container">
      <Base
        tag=#img
        width=[xs(100.0->#pct)]
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
