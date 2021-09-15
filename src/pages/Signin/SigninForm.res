module Fields = %lenses(
  type state = {
    email: string,
    password: string,
  }
)

include ReForm.Make(Fields)

let initialState: Fields.state = {
  email: "",
  password: "",
}

let useForm = use
