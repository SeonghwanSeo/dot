-- Autocmd
vim.api.nvim_exec([[autocmd FileType python set tabstop=4 shiftwidth=4]], false)
vim.api.nvim_exec([[autocmd FileType lua set tabstop=2 shiftwidth=2]], false)

vim.api.nvim_exec([[autocmd TermOpen * set nonu | :set nornu | :set signcolumn=no | :startinsert]], false)

vim.api.nvim_exec([[autocmd WinEnter * if &buftype == '' | :set relativenumber | endif]], false)
vim.api.nvim_exec([[autocmd WinLeave * if &buftype == '' | :set norelativenumber | endif]], false)

-- nvim python
-- vim.api.nvim_exec([[autocmd FileType python nnoremap <C-i> :w<CR>:!python %<CR>]], false)
