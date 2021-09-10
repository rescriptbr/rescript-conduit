@module("localforage")
external setItem: (string, 'a) => Promise.t<string> = "setItem"

@module("localforage")
external getItem: string => Promise.t<'a> = "getItem"
