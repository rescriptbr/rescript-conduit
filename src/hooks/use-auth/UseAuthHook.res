open ReScriptToolkit

type status = LoggedIn | Checking | LoggedOut
type contextValue = {status: status}

let context = React.createContext({status: Checking})
let provider = React.Context.provider(context)

let unauthorizedEvent = "UNAUTHORIZED"
let emitter = Mitt.make()

module Provider = {
  @react.component
  let make = (~children) => {
    let (status, setStatus) = React.useState(_ => Checking)

    ReactUse.useMount(() => {
      open Promise

      Storage.get(#token)
      ->thenResolve(maybeToken => {
        switch maybeToken {
        | None => setStatus(_ => LoggedOut)
        | Some(_) => setStatus(_ => LoggedIn)
        }
      })
      ->ignore
    })

    ReactUse.useMount(() => {
      emitter->Mitt.on(unauthorizedEvent, () => setStatus(_ => LoggedOut))
    })

    React.createElement(
      provider,
      {
        "children": children,
        "value": {status: status},
      },
    )
  }
}

let useAuth = () => React.useContext(context)
