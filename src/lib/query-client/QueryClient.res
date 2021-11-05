exception QueryClientError(Fetch.Response.t)

let apiUrl = "https://conduit-api-fp.herokuapp.com/api"

let validateRequestError = response => {
  switch response->Fetch.Response.status {
  | 401 => LocalForage.clear()->ignore
  | _ => ()
  }
  switch response->Fetch.Response.ok {
  | false => Promise.reject(QueryClientError(response))
  | true => Promise.resolve(response)
  }
}

let post = (~url, body) => {
  open Promise

  Storage.get(#token)->then(token => {
    Fetch.fetch(
      `${apiUrl}${url}`,
      {
        "method": "POST",
        "body": switch body {
        | Some(body) => Js.Json.stringifyAny(body)
        | None => Some("{}")
        },
        "headers": {
          "Content-Type": "application/json",
          "Authorization": switch token {
          | Some(token) => `Token ${token}`
          | None => ""
          },
        },
      },
    )
    ->then(validateRequestError)
    ->then(response => Fetch.Response.json(response))
  })
}

let get = (~url) => {
  open Promise

  Storage.get(#token)->then(token => {
    Fetch.fetch(
      `${apiUrl}${url}`,
      {
        "method": "GET",
        "headers": {
          "Content-Type": "application/json",
          "Authorization": switch token {
          | Some(token) => `Token ${token}`
          | None => ""
          },
        },
      },
    )
    ->then(validateRequestError)
    ->then(response => Fetch.Response.json(response))
  })
}
