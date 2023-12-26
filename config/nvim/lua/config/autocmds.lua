-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function(event)
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function(event)
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(event)
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function(event)
    if vim.api.nvim_buf_get_option(event.buf, "buftype") == "" then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function(event)
    if vim.api.nvim_buf_get_option(event.buf, "buftype") == "" then
      vim.wo.relativenumber = false
    end
  end,
})
