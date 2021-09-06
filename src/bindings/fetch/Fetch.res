module Response = {
  type t
  @send external json: t => Js.Promise.t<Js.Json.t> = "json"
}

@val external fetch: (string, {..}) => Js.Promise.t<Response.t> = "fetch"
