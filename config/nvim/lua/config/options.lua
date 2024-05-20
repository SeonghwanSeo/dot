-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.mouse = ""
vim.opt.signcolumn = "yes:1"
vim.opt.ignorecase = false
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = true
vim.opt.linebreak = true

-- -- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"
