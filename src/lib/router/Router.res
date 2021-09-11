type routes =
  | Home
  | Signin
  | Signup
  | NotFound

let toString = route =>
  switch route {
  | Home => "/"
  | Signin => "/signin"
  | Signup => "/signup"
  | NotFound => "/not-found"
  }

let routeFromUrl = (url: RescriptReactRouter.url) => {
  switch url.path {
  | list{} => Home
  | list{"signin"} => Signin
  | list{"signup"} => Signup
  | _ => NotFound
  }
}

let push = route => route->toString->RescriptReactRouter.push

let useRouter = () => {
  let url = RescriptReactRouter.useUrl()

  routeFromUrl(url)
}
