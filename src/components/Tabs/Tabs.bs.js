// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Render from "../../lib/Render.bs.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Tabs_Styles from "./Tabs_Styles.bs.js";

function Tabs$Tab(Props) {
  var label = Props.label;
  var onChange = Props.onChange;
  var id = Props.id;
  var active = Props.active;
  return React.createElement("li", {
              className: Tabs_Styles.tab(active)
            }, React.createElement("button", {
                  onClick: (function (param) {
                      return Curry._1(onChange, id);
                    })
                }, Render.s(label)));
}

var Tab = {
  make: Tabs$Tab
};

function Tabs$Panel(Props) {
  var active = Props.active;
  var children = Props.children;
  if (active) {
    return React.createElement("div", undefined, children);
  } else {
    return null;
  }
}

var Panel = {
  make: Tabs$Panel
};

function Tabs(Props) {
  var tabs = Props.tabs;
  var onChange = Props.onChange;
  var current = Props.current;
  return React.createElement("ul", {
              className: Tabs_Styles.tabs
            }, Render.map(tabs, (function (tab, key) {
                    return React.createElement(Tabs$Tab, {
                                label: tab.label,
                                onChange: onChange,
                                id: tab.id,
                                active: Caml_obj.caml_equal(current, tab.id),
                                key: key
                              });
                  })));
}

var Styles;

var $$Array;

var make = Tabs;

export {
  Styles ,
  $$Array ,
  Tab ,
  Panel ,
  make ,
  
}
/* react Not a pure module */
