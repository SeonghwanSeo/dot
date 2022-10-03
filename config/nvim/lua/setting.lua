-- File: /home/sergio/.config/nvim/lua/core/settings.lua
-- Last Change: Sun, 29 May 2022 13:51

-- aliases
local opt  = vim.opt -- global
local g  = vim.g     -- global for let options
local wo = vim.wo    -- window local
local bo = vim.bo    -- buffer local
local fn = vim.fn    -- access vim functions
local cmd = vim.cmd  -- vim commands

local options = {
    -- syntax = "ON",        -- str:  Allow syntax highlighting
    showmatch = true,
    wildmode = "longest:full,full",
    shiftround = true, -- Round indent
    shiftwidth = 4, -- Size of an indent
    expandtab = true,
    signcolumn = "yes:1", -- always show signcolumns
    smartindent = true, -- Insert indents automatically
    tabstop = 4, -- Number of spaces tabs count for
    ruler = true,
    clipboard = "unnamed",
    statusline = " %<%l:%v [%P]%=%a %F",
    laststatus = 2,
    path = vim.opt.path + "~/.config/nvim/lua",
    path = vim.opt.path + "**"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
--
-- window-local options
window_options = {
    -- numberwidth = 2,
    number = true,
    linebreak = true,
    cursorline = true,
}

for k, v in pairs(window_options) do
    vim.wo[k] = v
end

-- buffer-local options
buffer_options = {
    expandtab = true,
    softtabstop = 4,
    tabstop = 4,
    shiftwidth = 4,
    smartindent = true,
    suffixesadd = '.lua'
}

for k, v in pairs(buffer_options) do
    vim.bo[k] = v
end
