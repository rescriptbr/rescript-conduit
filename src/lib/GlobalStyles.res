open CssJs

let includeStyle = () => {
  global(. "html, body, #root", [padding(zero), margin(zero)])
  global(. "html", [fontSize(10->px)])
}
