return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      enabled = true,
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "numpydoc",
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>nc",
      ":lua require('neogen').generate({})<CR>",
      desc = "Neogen Comment",
    },
  },
}
