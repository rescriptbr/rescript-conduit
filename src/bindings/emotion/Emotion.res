@module("@emotion/css") external css: {..} => string = "css"
@module("@emotion/css") external keyframes: {..} => string = "keyframes"
@module("@emotion/css") external cx: array<string> => string = "cx"
@module("@emotion/css") external injectGlobal: string => unit = "injectGlobal"
@module("@emotion/css") external compose: (string, string) => string = "css"

module Raw = {
  @module("@emotion/css") external css: string => string = "css"
}
