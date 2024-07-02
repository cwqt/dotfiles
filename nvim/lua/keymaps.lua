local map = require 'utils.map'

local M = {}

M.setup = function()
  -- opening & closing tabs with sayonara
  map('n', '<A-n>', '<cmd>enew<CR>', { silent = true })
  map('n', '<A-w>', '<cmd>Sayonara!<CR>', { silent = true })
  map('n', '<A-q>', '<cmd>Sayonara<CR>', { silent = true })
  map('n', '<A-W>', '<cmd>Resurrect<CR>', { silent = true })

  -- open search and replace
  map('n', '<leader>sr', ':GrugFar<CR>', { silent = true })
  -- toggle line numbers
  map('n', '<leader>n', ':set number! number?<CR>', { silent = true })
  -- hide hi from search
  map('n', '_', ':nohl<CR>', { silent = true })
  -- view treesitter tokens under cursor
  map('n', '<leader>i', '<cmd>Inspect<CR>', { silent = true })
  -- reset diagnostics
  map('n', '<leader>r', '<cmd>lua vim.diagnostic.reset()<CR>', { silent = true })
  -- reset cursor to always be in the middle of the screen
  map('n', '<leader>cc', ':set scrolloff=999<CR>', { silent = true })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<A-w>', [[<C-\><C-n><C-w>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
end

return M
