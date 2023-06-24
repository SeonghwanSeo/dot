-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if false then return {} end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  --{ "williamboman/mason.nvim", enabled = false },
  --{ "williamboman/mason-lspconfig.nvim", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "echasnovski/mini.comment", enabled = false },
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
  --{ "echasnovski/mini.indentscope", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "tpope/vim-repeat", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  { "nvim-pack/nvim-spectre", enabled = false },
  --{ "folke/trouble.nvim", enabled = false },
  --{ "folke/todo-comments.nvim", enabled = false },
  --{ "neovim/nvim-lspconfig", enabled = false }, --   경고 문구
  --{ "lewis6991/gitsigns.nvim", enabled = false },
  --{ "jose-elias-alvarez/null-ls.nvim", enabled = false },
  --{ "MunifTanjim/nui.nvim", enabled = false },
  --{ "akinsho/bufferline.nvim", enabled = false },
  --{ "RRethy/vim-illuminate", enabled = false },
}
