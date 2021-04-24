let str = React.string

module Button = {
  @react.component
  let make = (~onClick, ~label="Label") => {
    <button onClick> {str(label)} </button>
  }
}

@react.component
let make = () => {
  let (state, setState) = React.useState(_ => 0)

  let handleIncrement = _ => setState(_ => state + 1)
  let handleDecrement = _ => setState(_ => state - 1)

  <div>
    <h1> {React.int(state)} </h1>
    <Button onClick={handleIncrement} label="Increment" />
    <Button onClick={handleDecrement} label="Decrement" />
  </div>
}
