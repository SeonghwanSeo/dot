
local lsp_signature = require "lsp_signature"
lsp_signature.setup({
  hint_prefix = " ",
  floating_window_off_x = 10000, -- adjust float windows x position. 
                             -- can be either a number or function
  floating_window_off_y = -10000, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
})
 vim.keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win()
    end, { silent = true, noremap = true, desc = 'toggle signature' })
