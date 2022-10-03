vim.opt.termguicolors = true
require"bufferline".setup {
  highlights = {
    fill = {
      bg = "#24283b",
    },
    background = {
      fg = "#c0caf5",
      bg = "#1a1b26",
    },
    separator = {
      fg = "#1a1b26",
      bg = "#1a1b26",
    },
    buffer_visible = {
      fg = "#a9b1d6",
      bg = "#1a1b26",
    },
    buffer_selected = {
      fg = "#f7768e",
      bg = "#1a1b26",
    },
    tab = {
      fg = "#a9b1d6",
      bg = "#1a1b26",
    },
    tab_selected = {
      fg = "#f7768e",
      bg = "#1a1b26",
    },
    numbers_selected = {
      fg = "#f7768e",
      bold = true,
      italic = true,
    },
    indicator_selected = {
      fg = "#f7768e",
    },
  },
  options = {
    numbers = "buffer_id",
    indicator = {
      style = 'underline',
      numbers = 'buffer_id',
    },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    tab_size = 15
  },
}
