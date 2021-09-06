let apiUrl = "https://conduit-api-fp.herokuapp.com/api"

let post = (~url, body) => {
  open Promise

  Fetch.fetch(
    `${apiUrl}${url}`,
    {
      "method": "POST",
      "body": Js.Json.stringifyAny(body),
      "headers": {
        "Content-Type": "application/json",
      },
    },
  )->then(response => Fetch.Response.json(response))
}
