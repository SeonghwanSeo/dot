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

-- NvimTree
custom_map("n", "<leader><leader>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

custom_map("n", "Y", "y$")

-- Inactivate C-z
custom_map("n", "<C-Z>", "<nop>", {silent = true})
custom_map("v", "<C-Z>", "<nop>", {silent = true})    -- x(visual), s(select)
custom_map("!", "<C-Z>", "<nop>", {silent = true})    -- i(insert), c(command)

-- Buffer
custom_map("n", "<leader>h", ":bp<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>l", ":bn<CR>", {noremap = true, silent = true})
custom_map("n", "<C-C>", ":bd<CR>", {noremap = true, silent = true})
custom_map("n", "<C-H>", ":BufferLineMovePrev<CR>", {noremap = true, silent = true})
custom_map("n", "<C-L>", ":BufferLineMoveNext<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
custom_map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})

--Tab
custom_map("n", "T", ":tabnew<CR>", {noremap = true})
custom_map("n", "<leader>[", ":tabprevious<CR>", {noremap = true})
custom_map("n", "<leader>]", ":tabnext<CR>", {noremap = true})

--Terminal
custom_map("t", "<Esc>", "<C-\\><C-n>:q!<CR>", {noremap = true})


vim.api.nvim_exec([[
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev q1 q!
  cnoreabbrev Q1 q!
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

local nu = true
function _G.NumberToggle()
  if nu then
    vim.api.nvim_command("set nonumber")
    nu = false
  else
    vim.api.nvim_command("set number")
    nu = true
  end
end

function _G.copy_mode()
  vim.api.nvim_command("Gitsigns toggle_signs")
  vim.api.nvim_command("IndentBlanklineToggle")
  NumberToggle()
  SignColumnToggle()
end
custom_map("n", "<leader>cp", ":lua copy_mode()<CR>")
