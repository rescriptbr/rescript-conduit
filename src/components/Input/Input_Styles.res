open Emotion.Raw

let commonStyles = (error) =>
    `
  height: 5.6rem;
  width: 100%;
  background: ${Theme.Colors.lightBlue1};
  font-size: 2.0rem;
  border-style: none;
  border-radius: ${Theme.Radius.small};
  padding: 0 ${Theme.Spacing.make(3.)};
  box-sizing: border-box;
  color: ${Theme.Colors.black};
  outline-style: none;
  transition: 300ms;
  &:focus {
    transition: 300ms;
    box-shadow: ${switch error {
      | None => `0px 0px 0px 2px ${Theme.Colors.blue}`
      | Some(_) => ""
      }};
  }

  box-shadow: ${switch error {
      | None => "none"
      | Some(_) => `0px 0px 0px 2px ${Theme.Colors.red}`
      }};

  &::placeholder: {
    color: ${Theme.Colors.gray2};
  }
`

let input = (~error) => error->commonStyles->css

let textarea = (~error) => css(`
  ${commonStyles(error)};
  height: 18.5rem;
  padding: ${Theme.Spacing.make(3.)};
  resize: none;
`)
