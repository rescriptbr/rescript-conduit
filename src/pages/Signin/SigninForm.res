module Fields = %lenses(
  type state = {
    email: string,
    password: string,
    age: int,
  }
)

include ReForm.Make(Fields)

let initialState: Fields.state = {
  email: "",
  password: "",
  age: 10,
}

let useForm = use
