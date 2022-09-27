require"bufferline".setup {
  options = {
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'underline',
      numbers = 'buffer_id',
    },
    show_buffer_close_icons = false,
    show_close_icon = false,
    diagnostics = "coc",
  }
}
