open Render

GlobalStyles.includeStyles()

@react.component
let make = () => {
  <div className="py-4 w-10 mx-auto"> <Button> {`Click here`->s} </Button> </div>
}
