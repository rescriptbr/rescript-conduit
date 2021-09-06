type user = {
  email: string,
  password: string,
}

type signinPayload = {user: user}

@decco
type loggedUser = {token: string}

@decco
type response = {user: loggedUser}

let handleSignin = (payload: signinPayload) =>
  QueryClient.post(~url="/users/login", payload)->Promise.then(json =>
    json->response_decode->Promise.resolve
  )

let useSignin = () => {
  let handleSuccess = React.useCallback0((result, _, _) => {
    switch result {
    | Ok(response) => Js.log(("Token =>", response.user.token))
    | Error(error) => Js.log(("API Error =>", error))
    }

    Promise.resolve()
  })

  let {mutate} = ReactQuery.useMutation(
    ReactQuery.mutationOptions(
      //
      ~mutationKey="signin",
      ~mutationFn=handleSignin,
      ~onSuccess=handleSuccess,
      (),
    ),
  )

  let handleSubmit = _ => {
    mutate(.
      {
        user: {
          email: "john@doe.com",
          password: "myRe4l1ySaf3Passw0rd!#",
        },
      },
      None,
    )
  }

  handleSubmit
}
