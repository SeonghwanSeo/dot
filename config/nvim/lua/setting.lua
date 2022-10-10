-- aliases
local opt  = vim.opt -- global
local wo = vim.wo    -- window local
local bo = vim.bo    -- buffer local

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
