open Render
open AncestorConduit

@react.component
let make = (~title, ~body, ~author: UseArticlesHook.author) => {
  <Box mb=[xs(3)]>
    <Card>
      <Box>
        <Text
          tag=#h2
          fontWeight=[#xs(#400)]
          m=[xs(0)]
          lineHeight=[xs(3.1->#rem)]
          fontSize=[xs(2.4->#rem)]
          color=[xs(Theme.Colors.Ancestor.black)]>
          {title->s}
        </Text>
        <Text
          mt=[xs(1)]
          tag=#p
          fontWeight=[xs(#400)]
          m=[xs(0)]
          lineHeight=[xs(3.1->#rem)]
          fontSize=[xs(1.8->#rem)]
          color=[xs(Theme.Colors.Ancestor.gray1)]>
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
          <Typography.Paragraph noMargin=true color=Theme.Colors.black level=#3>
            {author.username->s}
          </Typography.Paragraph>
        </Box>
      </Box>
    </Card>
  </Box>
}
