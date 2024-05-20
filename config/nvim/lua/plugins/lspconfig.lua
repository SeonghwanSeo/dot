local Util = require("lazyvim.util")
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        single_file_support = true,
        setting = {
          pyright = { disableLanguageServices = false, disableOrganizeImports = false },
          python = {
            analysis = {
              diagnosticMode = "workspace",
              typeCheckingMode = "standard",
              diagnosticSeverityOverrides = {
                reportImplicitStringConcatenation = "none",
                reportGeneralTypeIssues = "warning",
                reportDeprecated = "warning",
                reportUnusedVariable = "none",
                reportUnusedImport = "none",
              },
            },
          },
        },
      },
      ruff_lsp = {
        single_file_support = true,
        init_options = {
          settings = {
            lint = { args = { "--line-length=120" } },
            format = { args = { "--line-length=120" } },
          },
        },
      },
    },
  },
}
