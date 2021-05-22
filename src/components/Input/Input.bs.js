// Generated by ReScript, PLEASE EDIT WITH CARE

import * as CssJs from "bs-css-emotion/src/CssJs.bs.js";
import * as Theme from "../../lib/Theme.bs.js";
import * as React from "react";
import * as Render from "../../lib/Render.bs.js";
import * as Caml_option from "bs-platform/lib/es6/caml_option.js";

var label = CssJs.style([
      CssJs.fontSize(CssJs.rem(2.0)),
      CssJs.color(CssJs.hex(Theme.Colors.black)),
      CssJs.fontFamily(Theme.fontFamily),
      CssJs.display(CssJs.block),
      CssJs.marginBottom(CssJs.rem(0.8))
    ]);

var input = CssJs.style([
      CssJs.height(CssJs.rem(5.6)),
      CssJs.width(CssJs.pct(100.0)),
      CssJs.background(CssJs.hex(Theme.Colors.lightBlue1)),
      CssJs.fontFamily(Theme.fontFamily),
      CssJs.fontSize(CssJs.rem(2.0)),
      CssJs.borderStyle(CssJs.none),
      CssJs.borderRadius(Theme.Radius.small),
      CssJs.padding2(CssJs.zero, CssJs.rem(2.4)),
      CssJs.boxSizing(CssJs.borderBox),
      CssJs.color(CssJs.hex(Theme.Colors.black)),
      CssJs.outlineStyle(CssJs.none),
      CssJs.placeholder([CssJs.color(CssJs.hex(Theme.Colors.gray2))])
    ]);

var Styles = {
  label: label,
  input: input
};

function Input(Props) {
  var placeholder = Props.placeholder;
  var name = Props.name;
  var onChange = Props.onChange;
  var type_ = Props.type_;
  var label$1 = Props.label;
  var tmp = {
    className: input
  };
  if (name !== undefined) {
    tmp.name = Caml_option.valFromOption(name);
  }
  if (placeholder !== undefined) {
    tmp.placeholder = Caml_option.valFromOption(placeholder);
  }
  if (type_ !== undefined) {
    tmp.type = Caml_option.valFromOption(type_);
  }
  if (onChange !== undefined) {
    tmp.onChange = Caml_option.valFromOption(onChange);
  }
  return React.createElement("div", undefined, label$1 !== undefined ? React.createElement("label", {
                    className: label
                  }, Render.s(label$1)) : null, React.createElement("input", tmp));
}

var make = Input;

export {
  Styles ,
  make ,
  
}
/* label Not a pure module */