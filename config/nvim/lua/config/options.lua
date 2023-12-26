-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- aliases
vim.g.rooter_pattern = { ".git" }
--vim.g.outermost_root = true

local options = {
  -- syntax = "ON",        -- str:  Allow syntax highlighting
  mouse = "",
  showmatch = true, -- show (), {}, []
  wildmode = "longest:full,full",
  shiftround = true, -- Round indent
  shiftwidth = 4, -- Size of an indent
  expandtab = true,
  signcolumn = "yes:1", -- always show signcolumns
  autoindent = true, -- Insert indents automatically
  smartindent = false, -- Insert indents automatically
  tabstop = 4, -- Number of spaces tabs count for
  ruler = true,
  clipboard = "unnamed,unnamedplus",
  --statusline = " %<%l:%v [%P]%=%a %F",
  hidden = true,
  laststatus = 2,
  ignorecase = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
--
-- window-local options
local window_options = {
  -- numberwidth = 2,
  number = true,
  relativenumber = true,
  linebreak = true,
  cursorline = true,
  wrap = true,
}

for k, v in pairs(window_options) do
  vim.wo[k] = v
end

-- buffer-local options
local buffer_options = {
  expandtab = true,
  softtabstop = 4,
  tabstop = 4,
  shiftwidth = 4,
  smartindent = true,
  suffixesadd = ".lua",
}

for k, v in pairs(buffer_options) do
  vim.bo[k] = v
end
