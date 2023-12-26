-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local api = vim.api
local g = vim.g
require("config.utils")

function _G.custom_map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader
g.mapleader = " "

custom_map("n", "Y", "y$")
custom_map("n", "<Esc><ESC>", ":nohlsearch<CR>", { noremap = true, silent = true })
custom_map("i", "<A-j>", "<Esc>j", { noremap = false, silent = true })
custom_map("i", "<A-k>", "<Esc>k", { noremap = false, silent = true })
custom_map("n", "<A-j>", "<Esc>j", { noremap = false, silent = true })
custom_map("n", "<A-k>", "<Esc>k", { noremap = false, silent = true })
custom_map("v", "<A-j>", "<Esc>j", { noremap = false, silent = true })
custom_map("v", "<A-k>", "<Esc>k", { noremap = false, silent = true })
-- NvimTree
-- custom_map("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- Delete Without Copy
custom_map("v", "p", '"_dP', { noremap = true, silent = true })
custom_map("v", "d", '"_d', { noremap = true, silent = true })
custom_map("v", "s", '"_s', { noremap = true, silent = true })
custom_map("n", "x", '"_x', { noremap = true, silent = true })
custom_map("n", "s", '"_s', { noremap = true, silent = true })

-- Inactivate C-z
custom_map("n", "<C-Z>", "<nop>", { silent = true })
custom_map("v", "<C-Z>", "<nop>", { silent = true }) -- x(visual), s(select)
custom_map("!", "<C-Z>", "<nop>", { silent = true }) -- i(insert), c(command)

-- Inactivate Shift-K
custom_map("n", "K", "<nop>", { silent = true })
custom_map("v", "K", "<nop>", { silent = true })

-- BufferLine
custom_map("n", "<leader>h", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>l", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>be", ":BufferLineSortByExtension<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>bd", ":BufferLineSortByDirectory<CR>", { noremap = true, silent = true })

custom_map("n", "<C-H>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
custom_map("n", "<C-L>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
custom_map("n", "<C-C>", ":lua require('config.utils').bufferclose()<CR>", { noremap = true, silent = true })

custom_map("n", "<leader>0", ":Neotree<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })

--Terminal
custom_map("n", "<leader>t", ":terminal<CR>", { noremap = true })
-- custom_map("t", "<Esc>", "<C-\\><C-n><CR>", {noremap = true, silent = true})
custom_map("t", "<C-X>", "<C-\\><C-n>", { noremap = true, silent = true })
custom_map("t", "<C-W>", "<C-\\><C-n><C-W>", { noremap = true, silent = true })
custom_map(
  "t",
  "<C-Q>",
  "<C-\\><C-n>:lua require('config.utils').terminalclose()<CR>",
  { noremap = true, silent = true }
)
custom_map("n", "<C-Q>", ":lua require('config.utils').safe_terminalclose()<CR>", { noremap = true, silent = true })

-- Telescope
-- custom_map("n", "<leader>ff", ":Telescope find_files<CR>", {silent = true, noremap=true})
custom_map("n", "<leader>fh", ":Telescope oldfiles<CR>", { silent = true, noremap = true })
custom_map("n", "<leader>fw", ":Telescope live_grep<CR>", { silent = true, noremap = true })

vim.api.nvim_exec(
  [[
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
]],
  false
)

local signcolumn_tog = true
function _G.SignColumnToggle()
  if signcolumn_tog then
    vim.api.nvim_command("set scl=no")
    signcolumn_tog = false
  else
    vim.api.nvim_command("set scl=yes")
    signcolumn_tog = true
  end
end

local nu_tog = true
function _G.NumberToggle()
  if nu_tog then
    vim.api.nvim_command("set nonumber")
    vim.api.nvim_command("set norelativenumber")
    nu_tog = false
  else
    vim.api.nvim_command("set number")
    vim.api.nvim_command("set relativenumber")
    nu_tog = true
  end
end

function _G.copy_mode()
  vim.api.nvim_command("IBLToggle")
  vim.api.nvim_command("Gitsigns toggle_signs")
  vim.api.nvim_command("lua require('lazyvim.util').toggle.diagnostics()")
  NumberToggle()
  SignColumnToggle()
end
custom_map("n", "<leader>cp", ":lua copy_mode()<CR>")
