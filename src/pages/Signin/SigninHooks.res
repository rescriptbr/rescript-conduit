type signinPayload = {user: SigninForm.Fields.state}

@decco
type loggedUser = {token: string}

@decco
type response = {user: loggedUser}

let handleSignin = (payload: signinPayload) =>
  QueryClient.post(~url="/users/login", payload)->Promise.then(json =>
    json->response_decode->Promise.resolve
  )

module Validation = SigninForm.Validation

let useSignin = () => {
  let handleSuccess = (result, _, _) => {
    switch result {
    | Ok(response) => Storage.set(#token, response.user.token)->ignore
    | Error(_) => Js.log("API Error :(")
    }

    Promise.resolve()
  }

  let {mutate: signinMutation} = ReactQuery.useMutation(
    ReactQuery.mutationOptions(
      ~onSuccess=handleSuccess,
      ~mutationKey="signin",
      ~mutationFn=handleSignin,
      (),
    ),
  )

  let onSubmit = ({state}: SigninForm.onSubmitAPI) => {
    signinMutation(. {user: state.values}, None)

    None
  }

  let form = SigninForm.useForm(
    ~validationStrategy=OnDemand,
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

  form
}
