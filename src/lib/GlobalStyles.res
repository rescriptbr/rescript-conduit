let includeStyles = () =>
  Emotion.injectGlobal(`
  html, body, #root {
    padding: 0;
    margin: 0;
  }

  html {
    font-size: 10px;
  }

  * {
    box-sizing: border-box;
  }
`)
