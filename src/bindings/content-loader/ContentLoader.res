@react.component @module("react-content-loader")
external make: (
  ~height: string,
  ~width: string,
  ~speed: int,
  ~backgroundColor: string,
  ~foregroundColor: string,
  ~viewBox: string=?,
  ~children: React.element,
) => React.element = "default"
