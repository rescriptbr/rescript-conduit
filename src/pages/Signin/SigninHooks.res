type signinPayload = {user: SigninForm.Fields.state}

@decco
type loggedUser = {token: string}

@decco
type response = {user: loggedUser}

type hookResult = {
  form: SigninForm.api,
  isLoading: bool,
}

let handleFetch = (payload: signinPayload) => {
  open Promise

  QueryClient.post(~url="/users/login", payload)->thenResolve(json => json->response_decode)
}

let useSignin = () => {
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

    | Error(_) => Js.log("API Error :(")
    }

    Promise.resolve()
  }

  let {mutate: signinMutation, isLoading} = ReactQuery.useMutation(
    ReactQuery.mutationOptions(
      ~onSuccess=handleSuccess,
      ~mutationKey="signin",
      ~mutationFn=handleFetch,
      (),
    ),
  )

  let onSubmit = ({state}: SigninForm.onSubmitAPI) => {
    signinMutation(. {user: state.values}, None)

    None
  }

  let form = SigninForm.useForm(
    ~validationStrategy=OnChange,
    ~onSubmit,
    ~initialState=SigninForm.initialState,
    ~schema={
      open SigninForm.Validation

      Schema(
        nonEmpty(~error="Email is required", Email) +
        email(~error="Type a valid email", Email) +
        nonEmpty(~error="Password is required", Password) +
        string(~min=8, Password),
      )
    },
    (),
  )

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

  {form: form, isLoading: isLoading}
}
