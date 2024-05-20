-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local api = vim.api
local g = vim.g

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

-- BufferLine
custom_map("n", "<leader>h", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
custom_map("n", "<leader>l", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
custom_map("n", "<C-H>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
custom_map("n", "<C-L>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
custom_map("n", "<C-C>", ":bd<CR>", { noremap = true, silent = true })

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

vim.api.nvim_exec(
  [[
  cnoreabbrev W w
  cnoreabbrev W! w!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev Q q
  cnoreabbrev Q! q!
  cnoreabbrev q1 q!
  cnoreabbrev Q1 q!
]],
  false
)

local copy_tog = true
function _G.CopyToggle()
  if copy_tog then
    vim.api.nvim_command("NoiceDisable")
    vim.api.nvim_command("set scl=no")
    vim.api.nvim_command("set nonumber")
    vim.api.nvim_command("set norelativenumber")
    vim.api.nvim_command("set list!")
    copy_tog = false
  else
    vim.api.nvim_command("NoiceEnable")
    vim.api.nvim_command("set scl=yes")
    vim.api.nvim_command("set number")
    vim.api.nvim_command("set relativenumber")
    vim.api.nvim_command("set list")
    copy_tog = true
  end
end

function _G.copy_mode()
  CopyToggle()
  vim.api.nvim_command("IBLToggle")
  vim.api.nvim_command("Gitsigns toggle_signs")
  vim.api.nvim_command("lua require('lazyvim.util').toggle.diagnostics()")
end

custom_map("n", "<leader>cp", ":lua copy_mode()<CR>")
