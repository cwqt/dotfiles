local M = {}

M.setup = function()
  require("gitsigns").setup({
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "┃" },
      changedelete = { text = "┃" },
    },
    preview_config = {
      border = "rounded",
      style = "minimal",
      row = 1,
    },
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      map(
        "n",
        "]h",
        "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
        { expr = true }
      )
      map(
        "n",
        "[h",
        "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
        { expr = true }
      )

      map("n", "ghu", ":Gitsigns reset_hunk<CR>")
      map("v", "ghu", ":Gitsigns reset_hunk<CR>")
      map("n", "ghp", ":Gitsigns preview_hunk<CR>")
      map("n", "ght", ":Gitsigns toggle_deleted<CR>")

      -- Text object
      map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
  })
end


return M
