return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "python",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
}
