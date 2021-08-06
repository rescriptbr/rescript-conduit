let apiUrl = "https://conduit-api-fp.herokuapp.com/api/users/login"

type user = {
  email: string,
  password: string,
}

@decco
type signinResponse = {token: string}

module Fetch = {
  module Response = {
    type t
    @send external json: t => Js.Promise.t<'t> = "json"
  }

  @val external fetch: (string, {..}) => Js.Promise.t<Response.t> = "fetch"
}

let handleSignin = (user: user) => {
  open Promise

  Fetch.fetch(
    apiUrl,
    {
      "method": "POST",
      "body": Js.Json.stringifyAny({"user": user}),
      "headers": {
        "Content-Type": "application/json",
      },
    },
  )->then(response => Fetch.Response.json(response))
}

let useSignin = () => {
  let {mutate, data} = ReactQuery.useMutation(
    ReactQuery.mutationOptions(
      //
      ~mutationKey="signin",
      ~mutationFn=handleSignin,
      (),
    ),
  )

  let handleSubmit = _ => {
    mutate(.
      {
        email: "john@doe.com",
        password: "myRe4l1ySaf3Passw0rd!#",
      },
      None,
    )
  }

  (handleSubmit, data)
}
