let includeStyles = () =>
  Emotion.injectGlobal(
    `
  html, body, #root {
    height: 100%;
    width: 100%;
    padding: 0;
    margin: 0;
    background: #f5f5f5;
  }

  html {
    font-size: 10px;
  }

  * {
    box-sizing: border-box;
    font-family: ${Theme.fontFamily};
  }

  ::selection {
    background: ${Theme.Colors.blue};
    color: ${Theme.Colors.white};
  }
`,
  )
