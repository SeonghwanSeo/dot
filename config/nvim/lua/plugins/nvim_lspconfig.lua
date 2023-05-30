local Util = require("lazyvim.util")
return {"neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      pylsp = {
        root_dir = Util.get_root,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = {'E501', 'W503', 'W605', 'E402'},
              },
            }
          }
        }
      },
      pyright = {
        root_dir = Util.get_root,
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
