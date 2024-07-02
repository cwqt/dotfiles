local map = require 'utils.map'

local M = {}

M.setup = function()
  -- calling `setup` is optional for customization
  require('fzf-lua').setup {
    grep = {
      prompt = 'fuzzy: ',
      header = false,
      no_header_i = true,
    },
    files = {
      header = false,
      no_header_i = true,
    },
    fzf_opts = {
      -- options are sent as `<left>=<right>`
      -- set to `false` to remove a flag
      -- set to `true` for a no-value flag
      -- for raw args use `fzf_args` instead
      ['--ansi'] = true,
      ['--info'] = 'inline-right',
      ['--height'] = '100%',
      ['--layout'] = false,
      ['--border'] = 'none',
      ['--highlight-line'] = true, -- fzf >= v0.53
    },
    winopts = {
      height = 0.4, -- window height
      width = 1, -- window width
      row = 1, -- window row position (0=top, 1=bottom)
      col = 0, -- window col position (0=left, 1=right)
      border = 'none',
      preview = {
        hidden = 'hidden',
      },
    },
  }

  map('n', '<leader>p', "<cmd>lua require('fzf-lua').files()<CR>")
  map('n', '<leader>f', "<cmd>lua require('fzf-lua').live_grep()<CR>")
end

return M
