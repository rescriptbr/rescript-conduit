export const maxWidth = (device, styles) => ({
  [`@media (max-width: ${device})`]: styles,
})
export const minWidth = (device, styles) => ({
  [`@media (min-width: ${device})`]: styles,
})
