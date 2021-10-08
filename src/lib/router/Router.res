type routes =
  | Home
  | Signin
  | Signup
  | UserSettings
  | NotFound

let toString = route =>
  switch route {
  | Home => "/"
  | Signin => "/signin"
  | Signup => "/signup"
  | UserSettings => "/settings"
  | NotFound => "/not-found"
  }

let routeFromUrl = (url: RescriptReactRouter.url) => {
  switch url.path {
  | list{} => Home
  | list{"signin"} => Signin
  | list{"signup"} => Signup
  | list{"settings"} => UserSettings
  | _ => NotFound
  }
}

let push = route => route->toString->RescriptReactRouter.push

let useRouter = () => {
  let url = RescriptReactRouter.useUrl()

  routeFromUrl(url)
}
