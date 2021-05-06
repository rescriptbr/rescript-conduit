open CssJs

let includeStyle = () => {
  global(. "html, body, #root", [padding(zero), margin(zero), fontSize(10->px)])
}
