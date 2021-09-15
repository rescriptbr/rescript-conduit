module Fields = %lenses(
  type state = {
    username: string,
    email: string,
    password: string,
  }
)

include ReForm.Make(Fields)

let initialState: Fields.state = {
  username: "",
  email: "",
  password: "",
}

let useForm = use
