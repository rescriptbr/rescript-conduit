type t = [#xxs | #xs | #sm | #md | #lg | #xl]

let valueOfDevice = value =>
  switch value {
  | #xxs => "0px"
  | #xs => "470px"
  | #sm => "600px"
  | #md => "960px"
  | #lg => "1280px"
  | #xl => "1920px"
  }

module Raw = {
  let greaterThan = (current, device, styles) =>
    `
  ${current}
  @media (min-width: ${device->valueOfDevice}) {
    ${styles}
  }
  `
}
