local map = require("utils.map")

local M = {}

M.setup = function()
  vim.cmd([[
function! FzfHighlights()
    highlight FzfBorder guifg=#54546e
endfunction

augroup FzfHighlights
    autocmd!
    autocmd ColorScheme * call FzfHighlights()
augroup END
]])

  require("fzf-lua").setup({
    fzf_opts = {
      -- options are sent as `<left>=<right>`
      -- set to `false` to remove a flag
      -- set to '' for a non-value flag
      -- for raw args use `fzf_args` instead
      ["--ansi"] = "",
      ["--prompt"] = "",
      ["--info"] = "default",
      ["--height"] = "100%",
      ["--layout"] = "default",
    },
    winopts = {
      height = 0.5, -- window height
      width = 1, -- window width
      row = 1, -- window row position (0=top, 1=bottom)
      col = 0, -- window col position (0=left, 1=right)
      -- on_create = function().setup()
      --   vim.cmd(":resize 18")
      -- end,
      border = { "─", "─", "─", " ", "", "", "", " " },
      hl = { border = "FzfBorder" },
      preview = {
        winopts = { -- builtin previewer window options
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorlineopt = "both",
          cursorcolumn = false,
          signcolumn = "no",
          list = false,
          foldenable = false,
          foldmethod = "manual",
        },
        delay = 0,
        scrollbar = false,
        title = false,
        layout = "vertical", -- horizontal|vertical|flex
        vertical = "up:50%",
      },
    },
    files = {
      previewer = false,
      prompt = "> ",
      show_cwd_header = false,
    },
    grep = {
      previewer = false,
      actions = {},
      no_header = true, -- hide grep|cwd header?
      no_header_i = true, -- hide interactive header?
    },
    blines = {
      previewer = false,
    },
  })

  map("n", "<Leader>f", ":FzfLua grep_project<CR>", { silent = true })
  map("n", "<Leader>p", ":FzfLua files<CR>", { silent = true })
  map("n", "<Leader>l", ":FzfLua blines<CR>", { silent = true })
  map("n", "<Leader>;", ":FzfLua buffers<CR>", { silent = true })

  -- hide fzf statusline
  vim.api.nvim_command(
    "autocmd! FileType fzf set laststatus=0 | autocmd BufLeave <buffer> set laststatus=3"
  )
end

return M
