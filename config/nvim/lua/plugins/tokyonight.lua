return {"folke/tokyonight.nvim",
  lazy = true,
  opts = {
    style = "moon",
    on_highlights = function(hl, c)
      hl.DiagnosticUnnecessary = {
        fg = c.blue,
        bg = c.terminal_black
      }
    end,
  },
}
