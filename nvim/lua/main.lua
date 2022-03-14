-- Core components ---------------------------------------------------------------
require("core.bufferline").setup()
require("core.file-tree").setup()
require("core.git").setup()
require("core.statusline").setup()
require("core.tree-sitter").setup()
require("lsp.main").setup()

-- Plugins -----------------------------------------------------------------------
require("plugins.comment").setup()
require("plugins.filetype").setup()
require("plugins.fterm").setup()
require("plugins.goto-preview").setup()
require("plugins.indent-blankline").setup()
require("plugins.scrollbar").setup()
require("plugins.todo-comments").setup()
require("plugins.trouble").setup()
require("plugins.twilight").setup()
require("plugins.which-key").setup()
require("plugins.fzf").setup()

-- Miscellaneous -----------------------------------------------------------------
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

-- Show lightbulb for code actions
vim.cmd([[
  autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
]])

-- Hide `~` after end of file
vim.o.fillchars = "eob: "
vim.opt.list = true
