module Response = {
  type t
  @send external json: t => Js.Promise.t<Js.Json.t> = "json"

  @get external ok: t => bool = "ok"

  @get external status: t => int = "status"
}

@val external fetch: (string, {..}) => Js.Promise.t<Response.t> = "fetch"
