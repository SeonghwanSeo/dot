local Util = require("lazyvim.util")
return {"neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        enabled = false,
        mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        ---@type LazyKeys[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      pylsp = {
        root_dir = Util.root.get,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = {'E501', 'W503', 'W605', 'E402'},
              },
              pyflakes = {enabled = false},
              mccabe = {enabled = false},
            }
          }
        }
      },
      pyright = {
        root_dir = Util.root.get,
        settings = {
          pyright = { disableLanguageServices = true, disableOrganizeImports = false },
          python = {
            analysis = {
              -- reportMissingTypeStubs=true,
              diagnosticSeverityOverrides = {
                reportGeneralTypeIssues = "warning"
              },
              diagnosticMode = "workspace",
              -- useLibraryCodeForTypes = true,
              typeCheckingMode = "basic",
            }
          },
        },
        single_file_support = false,
      }
    }
  },
}
