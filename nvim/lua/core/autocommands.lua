local M = {}

M.setup = function()
  -- Remove/add terminal padding when entering/leaving vim
  vim.cmd([[
augroup kitty_mp
  autocmd!
  autocmd VimLeave * :silent !kitty @ set-spacing padding=15 margin=0
  autocmd VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
augroup END
]])

  -- Highlight yanked text for 200ms using the "Visual" highlight group
  vim.cmd([[
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])
end

return M
