local M = {}

function terminalclose ()
  vim.ui.input({prompt = 'Do you want to close terminal? y/n: '}, 
    function(choice)
      if choice == 'y' then
        vim.api.nvim_command('bp | bd! #')
        vim.cmd('normal! :')
        print('close terminal')
      else
        vim.cmd('normal! :')
        print('remain terminal')
      end
    end)
end

M.terminalclose = terminalclose

M.bufferclose = function()
  local buffer = vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_get_option(buffer, 'modified') then
    -- vim.api.nvim_command('if &buftype != "terminal" | bp | bd # | endif')
    if vim.api.nvim_buf_get_option(buffer, 'buftype') == 'terminal' then
      terminalclose()
    else
      vim.api.nvim_command('bp | bd #')
    end
  else 
  end
end

return M
