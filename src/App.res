open Render

GlobalStyles.includeStyles()

let queryClient = ReactQuery.Provider.createClient()

@react.component
let make = () => {
  let route = Router.useRouter()

  <ReactQuery.Provider client={queryClient}>
    {switch route {
    | Signin => <Signin />
    | Signup => <Signup />
    | Home => "Home page..."->s
    | _ => "Not found..."->s
    }}
  </ReactQuery.Provider>
}
