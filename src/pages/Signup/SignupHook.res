module Regex = Js.Re

type payload = {user: SignupForm.Fields.state}

type hookResult = {
  form: SignupForm.api,
  isLoading: bool,
}

let handleFetch = payload => QueryClient.post(~url="/users", payload)

let useSignup = () => {
  let handleSuccess = (result, _, _) => {
    Js.log(result)

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
  {form: form, isLoading: isLoading}
}
