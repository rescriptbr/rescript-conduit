module type Icon = {
  @react.component
  let make: (
    ~className: string=?,
    ~width: Ancestor_CssTypes.Length.t=?,
    ~height: Ancestor_CssTypes.Length.t=?,
    ~color: string=?,
  ) => React.element
}

module type Interface = {
  let icon: React.component<{..}>
}

module Make = (Maker: Interface) => {
  @react.component
  let make = (
    ~className=?,
    ~width: Ancestor_CssTypes.Length.t=#rem(1.6),
    ~height: Ancestor_CssTypes.Length.t=#rem(1.6),
    ~color: string=Theme.Colors.gray1,
  ) => {
    React.createElement(
      Maker.icon,
      {
        "width": width->Ancestor_CssTypes.Length.toString,
        "height": height->Ancestor_CssTypes.Length.toString,
        "color": color,
        "className": className,
      },
    )
  }
}

module Like = Make({
  @module("./svgs/like.svg")
  external icon: React.component<{..}> = "ReactComponent"
})

module LikeFilled = Make({
  @module("./svgs/like-filled.svg")
  external icon: React.component<{..}> = "ReactComponent"
})
