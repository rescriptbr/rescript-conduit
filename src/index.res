let _ = switch ReactDOM.querySelector("#root") {
| None => Js.log("Componente root não encontrado")
| Some(element) => ReactDOM.render(<App />, element)
}
