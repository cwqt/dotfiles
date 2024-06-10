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
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
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
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
})
