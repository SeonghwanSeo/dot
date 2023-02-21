local lspconfig = require("lspconfig")

vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white]]
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=NONE]]

local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}

---- LSP settings (for overriding per client)
--local handlers =  {
--  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
--  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
--}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  --require "lsp_signature".on_attach(vim.lsp.buf.signature_help, bufnr)

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "<C-F>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "F", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  -- buf_set_keymap("n", "<leader>n", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities, {snippetSupport = false})

-- Lua LSP setting
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
else
  print("Unsupported system for sumneko")
end

lspconfig.pylsp.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
    handlers = handlers,
    plugins = {
      preload = {enabled=true},
    }
}

lspconfig.pyright.setup {
    root_dir = lspconfig.util.find_git_ancestor,
    settings = {
      pyright = { disableLanguageServices = true, disableOrganizeImports = false },
      python = {
        analysis = {
          --reportMissingTypeStubs=true,
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = "warning"
          },
          diagnosticMode = "workspace",
          --useLibraryCodeForTypes = false,
          typeCheckingMode = "basic",
        }
      },
    },
  single_file_support = false,
}

