@decco
type apiResponse = {user: UserTypes.t}

type result =
  | Data(UserTypes.t)
  | Error
  | DecodeError
  | Loading

let handleFetch = _ => QueryClient.get(~url="/user")->Promise.thenResolve(apiResponse_decode)

let useMe = () => {
  let result = {
    open ReactQuery

    useQuery(
      queryOptions(
        ~queryKey="user",
        ~queryFn=handleFetch,
        ~refetchOnWindowFocus=refetchOnWindowFocus(#bool(false)),
        ~retry=retry(#bool(false)),
        (),
      ),
    )
  }

  switch result {
  | {data: Some(Ok(response)), isLoading: false, isError: false} => Data(response.user)
  | {data: Some(Error(_)), isLoading: false, isError: false} => DecodeError
  | {data: None, isLoading: true, isError: false} => Loading
  | {data: None, isError: true, isLoading: false} => Error
  | _ => Loading
  }
}
