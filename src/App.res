GlobalStyles.includeStyles()

let queryClient = ReactQuery.Provider.createClient()

module Main = {
  @react.component
  let make = () => {
    let route = Router.useRouter()
    <Layout>
      {switch route {
      | Home => <Home />
      | UserSettings => <UserSettings />
      | _ => React.null
      }}
    </Layout>
  }
}

@react.component
let make = () => {
  let route = Router.useRouter()

  <UseAuthHook.Provider>
    <ReactQuery.Provider client={queryClient}>
      {switch route {
      | Signin => <Signin />
      | Signup => <Signup />
      | _ => <Main />
      }}
    </ReactQuery.Provider>
  </UseAuthHook.Provider>
}
