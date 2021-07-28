open Render
open TabsStyles

module Array = Belt.Array

type tab<'tabId> = {
  label: string,
  id: 'tabId,
}

type tabs<'tabId> = array<tab<'tabId>>

module Tab = {
  @react.component
  let make = (~label, ~onChange, ~id, ~active) =>
    <li className={tab(~active)}> <button onClick={_ => onChange(id)}> {label->s} </button> </li>
}

module Panel = {
  @react.component
  let make = (~active, ~children) => {
    active ? <div> children </div> : React.null
  }
}

@react.component
let make = (~tabs as tabsList, ~onChange, ~current) => {
  <ul className=tabs>
    {tabsList->map((tab, key) => {
      <Tab key label=tab.label id=tab.id onChange active={current == tab.id} />
    })}
  </ul>
}
