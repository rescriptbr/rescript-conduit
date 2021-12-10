type t

@module("mitt") external make: unit => t = "default"

@send external on: (t, string, unit => unit) => unit = "on"
@send external emit: (t, string) => unit = "emit"
