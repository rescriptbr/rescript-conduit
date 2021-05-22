// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Input from "./Input.bs.js";
import * as React from "react";
import * as Helpers from "../../lib/Helpers.bs.js";
import * as React$1 from "@storybook/react";

React$1.storiesOf("Input", Helpers.storybookModule).add("Basic usage", (function (param) {
          return React.createElement(Input.make, {
                      placeholder: "Some placeholder here"
                    });
        })).add("Input label", (function (param) {
        return React.createElement(React.Fragment, undefined, React.createElement(Input.make, {
                        placeholder: "E-mail here",
                        type_: "email",
                        label: "E-mail"
                      }), React.createElement("br", undefined), React.createElement(Input.make, {
                        placeholder: "Password here",
                        type_: "password",
                        label: "Password"
                      }));
      }));

export {
  
}
/*  Not a pure module */