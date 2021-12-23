open ReScriptToolkit

type status = LoggedIn | Checking | LoggedOut
type contextValue = {status: status, setStatus: (status => status) => unit}
type hookResult = {status: status, setToken: string => unit}
let context = React.createContext({
  status: Checking,
  setStatus: _ => (),
})
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
        "value": {status: status, setStatus: setStatus},
      },
    )
  }
}

let useAuth = (~onLoggedIn=?, ()) => {
  let {status, setStatus} = React.useContext(context)

  let setToken = token => {
    open Promise

    Storage.set(#token, token)
    ->then(_ => {
      setStatus(_ => LoggedIn)
      resolve()
    })
    ->ignore
  }

  React.useEffect1(() => {
    switch (onLoggedIn, status) {
    | (Some(cb), LoggedIn) => cb()
    | (_, _) => ()
    }

    None
  }, [status])

  {status: status, setToken: setToken}
}
