-- Autocmd
vim.api.nvim_exec([[autocmd FileType python nnoremap <C-i> :w<CR>:!python %<CR>]], false)
vim.api.nvim_exec([[autocmd FileType python set tabstop=4 shiftwidth=4]], false)
vim.api.nvim_exec([[autocmd User Startified setlocal cursorline]], false)

vim.api.nvim_exec([[autocmd TermOpen * set nonu | :set signcolumn=no | :startinsert]], false)
--vim.api.nvim_exec([[autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif]], false)
