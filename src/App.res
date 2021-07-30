open Render

GlobalStyles.includeStyles()

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  <>
    {switch url.path {
    | list{} => <Signin />
    | list{"signup"} => <Signup />
    | _ => "Not found..."->s
    }}
  </>
}
