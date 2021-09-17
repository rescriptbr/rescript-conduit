module Array = Js.Array2

let hasInvalidFields = (fieldsState: array<('a, ReForm.fieldState)>) => {
  fieldsState->Array.some(((_, state)) => {
    switch state {
    | Error(_)
    | Pristine
    | NestedErrors(_) => true
    | _ => false
    }
  })
}

let getInputValue = ReForm.Helpers.handleChange
