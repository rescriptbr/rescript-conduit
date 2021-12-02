open Render
open AncestorConduit

module LikeButton = {
  let button = Emotion.css({
    "background": "none",
    "border": "none",
    "cursor": "pointer",
  })

  @react.component
  let make = (~count) => {
    <Box
      tag=#button
      className=button
      right=[xs(3.2->#rem)]
      top=[xs(3.2->#rem)]
      position=[xs(#absolute)]
      display=[xs(#flex)]
      alignItems=[xs(#center)]
      justifyContent=[xs(#center)]>
      <Icons.Like width=#px(22) height=#px(22) />
      <Text
        tag=#span
        display=[xs(#block)]
        ml=[xs(1)]
        color=[xs(Theme.TypedColors.neutral["200"])]
        fontSize=[xs(1.6->#rem)]
        fontWeight=[xs(#400)]>
        {count->React.int}
      </Text>
    </Box>
  }
}

@react.component
let make = (~title, ~body, ~updatedAt, ~favoritesCount, ~author: UseArticlesHook.author) => {
  <Box mb=[xs(3)] position=[xs(#relative)]>
    <Card>
      <LikeButton count=favoritesCount />
      <Box>
        <Text
          tag=#h2
          fontWeight=[#xs(#500)]
          m=[xs(0)]
          letterSpacing=[xs(-0.03->#em)]
          lineHeight=[xs(3.1->#rem)]
          fontSize=[xs(2.4->#rem)]
          color=[xs(Theme.TypedColors.neutral["500"])]>
          {title->s}
        </Text>
        <Text
          mt=[xs(1)]
          tag=#p
          fontWeight=[xs(#400)]
          m=[xs(0)]
          lineHeight=[xs(3.1->#rem)]
          fontSize=[xs(1.8->#rem)]
          color=[xs(Theme.TypedColors.neutral["200"])]>
          {body->s}
        </Text>
      </Box>
      <Box display=[xs(#flex)] alignItems=[xs(#center)] mt=[xs(4)]>
        <Avatar
          size={4.2->#rem}
          name=author.username
          image={switch author.image {
          | "" => None
          | url => Some(url)
          }}
        />
        <Box ml=[xs(2)]>
          <Typography.Paragraph noMargin=true color=Theme.Colors2.black level=#3>
            {author.username->s}
          </Typography.Paragraph>
          <Text
            tag=#span
            color=[xs(Theme.TypedColors.neutral["200"])]
            fontSize=[xs(1.4->#rem)]
            lineHeight=[xs(1.8->#rem)]>
            {updatedAt->Js.Date.fromString->DateFns.format("MMM dd, yyyy")->s}
          </Text>
        </Box>
      </Box>
    </Card>
  </Box>
}
