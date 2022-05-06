local M = {}

M.setup = function()
  -- Remove/add terminal padding when entering/leaving or Ctrl+Z'ing
  vim.cmd([[
augroup kitty_mp
  autocmd!
  autocmd VimLeave,VimSuspend * :silent !kitty @ set-spacing padding=15 margin=0
  autocmd VimEnter,VimResume * :silent !kitty @ set-spacing padding=0 margin=0
augroup END
]])

  -- Highlight yanked text for 200ms using the "Visual" highlight group
  vim.cmd([[
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

  -- FIXME: stop numbers from fucking appearing
  vim.cmd([[
  augroup rm_numbers
    autocmd!
    autocmd WinEnter * :silent :set nonumber
  augroup END
  ]])

  -- remember cursor position in files
  vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
      local ft = vim.opt_local.filetype:get()
      -- don't apply to git messages
      if ft:match("commit") or ft:match("rebase") then
        return
      end
      -- get position of last saved edit
      local markpos = vim.api.nvim_buf_get_mark(0, '"')
      local line = markpos[1]
      local col = markpos[2]
      -- if in range, go there
      if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
        vim.api.nvim_win_set_cursor(0, { line, col })
      end
    end,
  })
end

return M
