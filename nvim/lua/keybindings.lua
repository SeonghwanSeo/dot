local api = vim.api
local cmd = vim.cmd
local g   = vim.g

function _G.custom_map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader
g.mapleader = " "

custom_map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>")
custom_map("n", "<leader>gp", ":Gitsigns prev_hunk<CR>")
custom_map("n", "<leader>gn", ":Gitsigns next_hunk<CR>")
custom_map("n", "<leader><leader>", ":Explore<CR>")
custom_map("n", "<leader>g", ":Gitsigns preview_hunk<CR>")
custom_map("n", "<leader>gn", ":Gitsigns next_hunk<CR>")
custom_map("n", "<leader>gp", ":Gitsigns prev_hunk<CR>")
custom_map("n", "Y", "y$")
custom_map("x", "K", ":move '<-2<CR>gv-gv")
custom_map("x", "K", ":move '>+1<CR>gv-gv")

-- Buffer
custom_map("n", "<C-n>", ":bn<CR>", {noremap = true})
custom_map("n", "<C-p>", ":bp<CR>", {noremap = true})
custom_map("n", "<C-x>", ":bd<CR>", {noremap = true})

vim.api.nvim_exec([[
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qall qall
]], false)

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then scopes["o"][key] = value end
end

local indent = 4
cmd "syntax enable"
cmd "filetype plugin indent on"
opt("b", "expandtab", true)
opt("b", "smartindent", true)
opt("b", "tabstop", indent)
opt("b", "shiftwidth", indent)
opt("o", "hidden", true)
opt("o", "laststatus", 2)
opt("o", "clipboard","unnamed,unnamedplus")
g.shada = "$XDG_DATA_HOME/nvim/shada/main.shada"

local signcolumn = true
function _G.SignColumnToggle()
  if signcolumn then
    vim.api.nvim_command("set scl=no")
    signcolumn = false
  else
    vim.api.nvim_command("set scl=yes")
    signcolumn = true
  end
end

function _G.copy_mode()
  vim.api.nvim_command("Gitsigns toggle_signs")
  vim.api.nvim_command("IndentBlanklineToggle")
  SignColumnToggle()
end
custom_map("n", "<leader>cp", ":lua copy_mode()<CR>")
