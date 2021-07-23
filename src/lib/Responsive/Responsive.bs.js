// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Devices from "../Devices.bs.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as ResponsiveTypes from "./ResponsiveTypes.bs.js";

function parseRecord(stringify, record, value) {
  var variant = value.NAME;
  if (variant === "md") {
    return {
            xxs: record.xxs,
            xs: record.xs,
            sm: record.sm,
            md: Curry._1(stringify, value.VAL),
            lg: record.lg,
            xl: record.xl
          };
  } else if (variant === "sm") {
    return {
            xxs: record.xxs,
            xs: record.xs,
            sm: Curry._1(stringify, value.VAL),
            md: record.md,
            lg: record.lg,
            xl: record.xl
          };
  } else if (variant === "xl") {
    return {
            xxs: record.xxs,
            xs: record.xs,
            sm: record.sm,
            md: record.md,
            lg: record.lg,
            xl: Curry._1(stringify, value.VAL)
          };
  } else if (variant === "xs") {
    return {
            xxs: record.xxs,
            xs: Curry._1(stringify, value.VAL),
            sm: record.sm,
            md: record.md,
            lg: record.lg,
            xl: record.xl
          };
  } else if (variant === "xxs") {
    return {
            xxs: Curry._1(stringify, value.VAL),
            xs: record.xs,
            sm: record.sm,
            md: record.md,
            lg: record.lg,
            xl: record.xl
          };
  } else {
    return {
            xxs: record.xxs,
            xs: record.xs,
            sm: record.sm,
            md: record.md,
            lg: Curry._1(stringify, value.VAL),
            xl: record.xl
          };
  }
}

function toRecord(values, stringify) {
  if (values !== undefined) {
    return Belt_Array.reduce(values, ResponsiveTypes.empty, (function (param, param$1) {
                  return parseRecord(stringify, param, param$1);
                }));
  } else {
    return ResponsiveTypes.empty;
  }
}

function valueByDevice(record, device) {
  if (device === "md") {
    return record.md;
  } else if (device === "sm") {
    return record.sm;
  } else if (device === "xl") {
    return record.xl;
  } else if (device === "xs") {
    return record.xs;
  } else if (device === "xxs") {
    return record.xxs;
  } else {
    return record.lg;
  }
}

function createStyles(values, device) {
  return Belt_Array.reduce(values, "", (function (styles, param) {
                var key = param[0];
                return Belt_Option.getWithDefault(Belt_Option.map(valueByDevice(param[1], device), (function (value) {
                                  return "\n      " + styles + "\n      " + key + ": " + value + ";\n      ";
                                })), styles);
              }));
}

function make(display, justifyContent, flexDirection, alignItems, p, px, py, pt, pb, pl, pr, m, mx, my, mt, mb, ml, mr, textAlign, param) {
  var values = [
    [
      "display",
      toRecord(display, (function (prim) {
              return prim;
            }))
    ],
    [
      "justify-content",
      toRecord(justifyContent, (function (prim) {
              return prim;
            }))
    ],
    [
      "align-items",
      toRecord(alignItems, (function (prim) {
              return prim;
            }))
    ],
    [
      "flex-direction",
      toRecord(flexDirection, (function (prim) {
              return prim;
            }))
    ],
    [
      "padding",
      toRecord(p, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-left",
      toRecord(px, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-right",
      toRecord(px, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-top",
      toRecord(py, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-bottom",
      toRecord(py, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-top",
      toRecord(pt, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-bottom",
      toRecord(pb, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-left",
      toRecord(pl, ResponsiveTypes.stringifySpacing)
    ],
    [
      "padding-right",
      toRecord(pr, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin",
      toRecord(m, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-left",
      toRecord(mx, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-right",
      toRecord(mx, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-top",
      toRecord(my, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-bottom",
      toRecord(my, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-top",
      toRecord(mt, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-bottom",
      toRecord(mb, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-left",
      toRecord(ml, ResponsiveTypes.stringifySpacing)
    ],
    [
      "margin-right",
      toRecord(mr, ResponsiveTypes.stringifySpacing)
    ],
    [
      "text-align",
      toRecord(textAlign, (function (prim) {
              return prim;
            }))
    ]
  ];
  var xxsStyles = createStyles(values, "xxs");
  var xsStyles = createStyles(values, "xs");
  var smStyles = createStyles(values, "sm");
  var mdStyles = createStyles(values, "md");
  var lgStyles = createStyles(values, "lg");
  var xlStyles = createStyles(values, "xl");
  return Devices.Raw.greaterThan(Devices.Raw.greaterThan(Devices.Raw.greaterThan(Devices.Raw.greaterThan(Devices.Raw.greaterThan(Devices.Raw.greaterThan("", "xxs", xxsStyles), "xs", xsStyles), "sm", smStyles), "md", mdStyles), "lg", lgStyles), "xl", xlStyles);
}

var $$Option;

export {
  $$Option ,
  parseRecord ,
  toRecord ,
  valueByDevice ,
  createStyles ,
  make ,
  
}
/* No side effect */