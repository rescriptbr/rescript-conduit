@module("localforage")
external setItem: (string, 'a) => Promise.t<string> = "setItem"

@module("localforage")
external getItem: string => Promise.t<Js.Nullable.t<'a>> = "getItem"

@module("localforage")
external clear: unit => Promise.t<unit> = "clear"
