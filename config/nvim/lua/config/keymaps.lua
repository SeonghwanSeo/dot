-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "

map("n", "Y", "y$")
map("n", "<Esc><ESC>", ":nohlsearch<CR>", { silent = true })
map({ "i", "n", "v" }, "<A-j>", "<Esc>j", { remap = true, silent = true })
map({ "i", "n", "v" }, "<A-k>", "<Esc>k", { remap = true, silent = true })

-- No gj gk
map({ "i", "n", "v" }, "j", "j", { remap = false, silent = true })
map({ "i", "n", "v" }, "k", "k", { remap = false, silent = true })

-- Delete Without Copy
map("n", "x", '"_x', { silent = true })
map("v", "s", '"_s', { silent = true })
map("v", "p", '"_dP', { silent = true })
map("v", "d", '"_d', { silent = true })

-- Inactivate C-z
map({ "n", "v", "i", "s", "c", "x" }, "<C-Z>", "<nop>", { silent = true })

-- BufferLine
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<leader>l", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<C-h>", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<C-l>", ":BufferLineMoveNext<CR>", { silent = true })
map("n", "<C-c>", ":bd<CR>", { silent = true })

map("n", "<leader>0", ":Neotree<CR>", { silent = true })
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { silent = true })
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { silent = true })
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { silent = true })
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { silent = true })
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { silent = true })
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { silent = true })
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { silent = true })
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { silent = true })
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { silent = true })

-- Outline
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

vim.cmd([[
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
]])

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
  vim.api.nvim_command("lua require('lazyvim.util').toggle.diagnostics()")
end
map("n", "<leader>cp", ":lua copy_mode()<CR>", { desc = "Copy Mode" })
