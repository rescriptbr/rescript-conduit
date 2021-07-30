open UIResponsiveProps

module Option = Belt.Option

let parseRecord = (stringify, record, value: breakpoints<'a>) =>
  switch value {
  | #xxs(xxs) => {...record, xxs: Some(xxs->stringify)}
  | #xs(xs) => {...record, xs: Some(xs->stringify)}
  | #sm(sm) => {...record, sm: Some(sm->stringify)}
  | #md(md) => {...record, md: Some(md->stringify)}
  | #lg(lg) => {...record, lg: Some(lg->stringify)}
  | #xl(xl) => {...record, xl: Some(xl->stringify)}
  }

let toRecord = (values: option<values<'a>>, stringify) =>
  switch values {
  | Some(values) => values->Belt.Array.reduce(empty, parseRecord(stringify))
  | None => empty
  }

let valueByDevice = (record, device) =>
  switch device {
  | #xxs => record.xxs
  | #xs => record.xs
  | #sm => record.sm
  | #md => record.md
  | #lg => record.lg
  | #xl => record.xl
  }

let createStyles = (values: array<(string, record)>, device: Devices.t) => {
  values->Belt.Array.reduce("", (styles, (key, record)) =>
    record
    ->valueByDevice(device)
    ->Option.map(value =>
      `
      ${styles}
      ${key}: ${value};
      `
    )
    ->Option.getWithDefault(styles)
  )
}

let make = (
  // Flex
  ~display: option<display>=?,
  ~justifyContent: option<justifyContent>=?,
  ~flexDirection: option<flexDirection>=?,
  ~alignItems: option<alignItems>=?,
  ~flexGrow: option<flexGrow>=?,
  ~flexShrink: option<flexShrink>=?,
  ~order: option<order>=?,
  // TODO: Como implementar com dois valores
  // ~alignSelf: option<>=?,
  // Padding
  ~p: option<spacing>=?,
  ~px: option<spacing>=?,
  ~py: option<spacing>=?,
  ~pt: option<spacing>=?,
  ~pb: option<spacing>=?,
  ~pl: option<spacing>=?,
  ~pr: option<spacing>=?,
  // Margin
  ~m: option<spacing>=?,
  ~mx: option<spacing>=?,
  ~my: option<spacing>=?,
  ~mt: option<spacing>=?,
  ~mb: option<spacing>=?,
  ~ml: option<spacing>=?,
  ~mr: option<spacing>=?,
  // Texts
  ~textAlign: option<textAlign>=?,
  ~letterSpacing: option<size>=?,
  ~lineHeight: option<size>=?,
  // Sizing
  ~width: option<size>=?,
  ~height: option<size>=?,
  ~minW: option<size>=?,
  ~minH: option<size>=?,
  ~maxW: option<size>=?,
  ~maxH: option<size>=?,
  // Placement
  ~position: option<position>=?,
  ~top: option<size>=?,
  ~bottom: option<size>=?,
  ~left: option<size>=?,
  ~right: option<size>=?,
  ~zIndex: option<size>=?,
  (),
) => {
  let values = [
    ("display", display->toRecord(stringify)),
    ("justify-content", justifyContent->toRecord(stringify)),
    ("align-items", alignItems->toRecord(stringify)),
    ("flex-direction", flexDirection->toRecord(stringify)),
    ("flex-grow", flexGrow->toRecord(stringifyGrow)),
    ("flex-shrink", flexShrink->toRecord(stringifyShrink)),
    ("order", order->toRecord(stringifyOrder)),
    // Padding
    ("padding", p->toRecord(stringifySpacing)),
    ("padding-left", px->toRecord(stringifySpacing)),
    ("padding-right", px->toRecord(stringifySpacing)),
    ("padding-top", py->toRecord(stringifySpacing)),
    ("padding-bottom", py->toRecord(stringifySpacing)),
    ("padding-top", pt->toRecord(stringifySpacing)),
    ("padding-bottom", pb->toRecord(stringifySpacing)),
    ("padding-left", pl->toRecord(stringifySpacing)),
    ("padding-right", pr->toRecord(stringifySpacing)),
    //Margin
    ("margin", m->toRecord(stringifySpacing)),
    ("margin-left", mx->toRecord(stringifySpacing)),
    ("margin-right", mx->toRecord(stringifySpacing)),
    ("margin-top", my->toRecord(stringifySpacing)),
    ("margin-bottom", my->toRecord(stringifySpacing)),
    ("margin-top", mt->toRecord(stringifySpacing)),
    ("margin-bottom", mb->toRecord(stringifySpacing)),
    ("margin-left", ml->toRecord(stringifySpacing)),
    ("margin-right", mr->toRecord(stringifySpacing)),
    //Texts
    ("text-align", textAlign->toRecord(stringify)),
    ("letter-spacing", letterSpacing->toRecord(stringifySize)),
    ("line-height", lineHeight->toRecord(stringifySize)),
    // Sizing
    ("width", width->toRecord(stringifySize)),
    ("height", height->toRecord(stringifySize)),
    ("min-width", minW->toRecord(stringifySize)),
    ("min-height", minH->toRecord(stringifySize)),
    ("max-width", maxW->toRecord(stringifySize)),
    ("max-height", maxH->toRecord(stringifySize)),
    // Position
    ("position", position->toRecord(stringify)),
    // Placement
    ("top", top->toRecord(stringifySize)),
    ("bottom", bottom->toRecord(stringifySize)),
    ("left", left->toRecord(stringifySize)),
    ("right", right->toRecord(stringifySize)),
    ("z-index", zIndex->toRecord(stringify)),
  ]

  let xxsStyles = createStyles(values, #xxs)
  let xsStyles = createStyles(values, #xs)
  let smStyles = createStyles(values, #sm)
  let mdStyles = createStyles(values, #md)
  let lgStyles = createStyles(values, #lg)
  let xlStyles = createStyles(values, #xl)

  ""
  ->Devices.Raw.greaterThan(#xxs, xxsStyles)
  ->Devices.Raw.greaterThan(#xs, xsStyles)
  ->Devices.Raw.greaterThan(#sm, smStyles)
  ->Devices.Raw.greaterThan(#md, mdStyles)
  ->Devices.Raw.greaterThan(#lg, lgStyles)
  ->Devices.Raw.greaterThan(#xl, xlStyles)
}
