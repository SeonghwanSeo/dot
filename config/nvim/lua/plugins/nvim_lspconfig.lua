local Util = require("lazyvim.util")
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pylsp = {
        root_dir = Util.root.get,
        filetypes = { 'python' },
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "E501", "W503", "W605", "E402" },
              },
              pyflakes = { enabled = false },
              mccabe = { enabled = false },
            },
          },
        },
      },
      pyright = {
        root_dir = Util.root.get,
        filetypes = { 'python' },
        include = {"**.py"},
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
    },
  },
}
