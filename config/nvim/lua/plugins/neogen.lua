return {
  "danymat/neogen",
  keys = {
    {
      "<leader>nc",
      function()
        require("neogen").generate({})
      end,
      desc = "Neogen Comment",
    },
  },
  opts = { snippet_engine = "luasnip" },
}
