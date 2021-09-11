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
