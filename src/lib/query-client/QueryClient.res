exception QueryClientError(Fetch.Response.t)

let apiUrl = "https://conduit-api-fp.herokuapp.com/api"

let post = (~url, body) => {
  open Promise

  Storage.get(#token)->then(token => {
    Fetch.fetch(
      `${apiUrl}${url}`,
      {
        "method": "POST",
        "body": Js.Json.stringifyAny(body),
        "headers": {
          "Content-Type": "application/json",
          "Authorization": switch token {
          | Some(token) => `Token ${token}`
          | None => ""
          },
        },
      },
    )->then(response => Fetch.Response.json(response))
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
    ->then(response => {
      switch response->Fetch.Response.ok {
      | false => Promise.reject(QueryClientError(response))
      | true => Promise.resolve(response)
      }
    })
    ->then(response => Fetch.Response.json(response))
  })
}
