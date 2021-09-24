module FadeIn = {
  @react.component
  let make = (~children, ~y=20, ~delay=0.6, ~duration=0.4) => {
    <FramerMotion.Element
      initial={"opacity": 0, "y": y}
      animate={
        "opacity": 1,
        "y": 0,
        "transition": {
          "delay": delay,
          "duration": duration,
        },
      }>
      {children}
    </FramerMotion.Element>
  }
}
