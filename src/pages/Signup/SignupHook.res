module Regex = Js.Re
module String = Js.String2

type signupPayload = {user: SignupForm.Fields.state}

@decco
type response = {user: UserTypes.t}

type hookResult = {
  form: SignupForm.api,
  handleUsernameChange: ReactEvent.Form.t => unit,
  isLoading: bool,
}

let handleFetch = (payload: signupPayload) =>
  QueryClient.post(~url="/users", payload)
  //
  ->Promise.then(response => {
    response->response_decode->Promise.resolve
  })

let useSignup = () => {
  let handleSuccess = (result, _, _) => {
    open Promise

    switch result {
    | Ok(response) =>
      Storage.set(#token, response.user.token)
      ->then(_ => {
        Router.push(Home)
        resolve()
      })
      ->ignore

    | Error(_) => Js.log("Implementar feedback de erro")
    }

    Promise.resolve()
  }

  let {mutate, isLoading} = ReactQuery.useMutation(
    ReactQuery.mutationOptions(
      ~mutationFn=handleFetch,
      ~mutationKey="signup",
      ~onSuccess=handleSuccess,
      (),
    ),
  )
  let handleSignup = ({state}: SignupForm.onSubmitAPI) => {
    mutate(. {user: state.values}, None)
    None
  }

  let form = SignupForm.useForm(
    ~validationStrategy=OnChange,
    ~onSubmit=handleSignup,
    ~initialState=SignupForm.initialState,
    ~schema={
      open SignupForm.Validation

      Schema(
        nonEmpty(~error="Email is required", Email) +
        nonEmpty(~error="Username is required", Username) +
        nonEmpty(~error="Password is required", Password) +
        email(Email) +
        string(~min=8, Password) +
        string(~min=2, Username) +
        regExp(~error="Invalid username", ~matches="^[a-z][a-z0-9_-]+?[a-z0-9]$", Username),
      )
    },
    (),
  )

  let handleUsernameChange = event => {
    let target = ReactEvent.Form.target(event)
    let value = target["value"]->String.toLowerCase->String.replaceByRe(%re("/\s+/g"), "")
    target["value"] = value

    form.handleChange(Username, value)
  }

  React.useEffect0(() => {
    open Promise

    Storage.get(#token)
    ->thenResolve(token =>
      switch token {
      | Some(_) => Router.push(Home)
      | None => ()
      }
    )
    ->ignore
    None
  })

  {form: form, handleUsernameChange: handleUsernameChange, isLoading: isLoading}
}
