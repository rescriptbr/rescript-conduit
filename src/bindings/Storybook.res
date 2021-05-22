type section

type storybookModule

type chapter = unit => React.element

type decorator = chapter => React.element

@val @module("@storybook/react")
external storiesOf: (string, storybookModule) => section = "storiesOf"

@send external add: (section, string, chapter) => section = "add"
