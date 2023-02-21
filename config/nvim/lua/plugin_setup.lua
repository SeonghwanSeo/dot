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
packer.startup(
  function()
    use {"wbthomason/packer.nvim"}

    --Colorscheme
    use {"folke/tokyonight.nvim"}

    -- LSP, CMP, TREESITTER
    use {"neovim/nvim-lspconfig"}
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- "saadparwaiz1/cmp_luasnip",
      }
    }
    use {"ray-x/lsp_signature.nvim"}
    use {"nvim-treesitter/nvim-treesitter"}

    use {
      'kyazdani42/nvim-tree.lua',
      tag = 'nightly', requires = {'kyazdani42/nvim-web-devicons', 'ygm2/rooter.nvim'},
    }
    use {"glepnir/dashboard-nvim"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"}
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
    use {"windwp/nvim-autopairs"} -- Autopairing parentheses, quotes
    use {"lukas-reineke/indent-blankline.nvim"} -- Indent lines
  end
)
