local fn = vim.fn
local api = vim.api

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim" end

local packer = require"packer"
local util = require"packer.util"

packer.init({
  package_root = util.join_paths(fn.stdpath("data"), "site", "pack"),
  git = {
      clone_timeout = 300, -- 5 mins
  },
  profile = {
      enable = true,
  },
})
packer.startup(function()
  use {"wbthomason/packer.nvim"}
  use {"nvim-treesitter/nvim-treesitter"}
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    }
  }
  use {"neovim/nvim-lspconfig"}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

  use {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons"}
  }
  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim" }
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {"nvim-lua/plenary.nvim"}
  }
  -- use {"glepnir/dashboard-nvim"}
  use {"sbdchd/neoformat"} -- Autoformat the code

  use {"windwp/nvim-autopairs"} -- Autopairing parentheses, quotes

  -- Colorscheme
  -- use {"sainnhe/gruvbox-material"}
  use {"folke/tokyonight.nvim"}

  use {"RRethy/vim-illuminate"} -- Highlight the words on the cursor
  use {"lukas-reineke/indent-blankline.nvim"} -- Indent lines
end)
