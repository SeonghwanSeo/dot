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
  -- { "echasnovski/mini.comment", enabled = false },
  { "echasnovski/mini.pairs", enabled = false },
  -- { "echasnovski/mini.surround", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "tpope/vim-repeat", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  { "nvim-pack/nvim-spectre", enabled = false },
  { "nvimtools/none-ls.nvim", enabled = false },
  { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "folke/flash.nvim", enabled = false },
  -- { "dstein64/vim-startuptime", enabled = false },
  --{ "williamboman/mason.nvim", enabled = false },
  --{ "williamboman/mason-lspconfig.nvim", enabled = false },
  --{ "echasnovski/mini.ai", enabled = false },
  --{ "echasnovski/mini.indentscope", enabled = false },
  --{ "folke/neoconf.nvim", enabled = false },
  --{ "folke/neodev.nvim", enabled = false },
  -- { "MunifTanjim/nui.nvim", enabled = false },
  -- { "L3MON4D3/LuaSnip", enabled = false },
  -- { "catppuccin/catppuccin", enabled = false },

  --{ "folke/trouble.nvim", enabled = false },
  --{ "lewis6991/gitsigns.nvim", enabled = false },
  --{ "akinsho/bufferline.nvim", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
}
