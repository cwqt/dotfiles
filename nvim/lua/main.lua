vim.cmd("colorscheme kanagawa")

-- Core -----------------------------------------
require("core.main").setup()
require("core.bufferline").setup()
require("core.file-tree").setup()
require("core.git").setup()
require("core.statusline").setup()
require("core.tree-sitter").setup()
require("core.keymaps").setup()
require("core.autocommands").setup()
require("lsp.main").setup()

-- Plugins ---------------------------------------
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
require("plugins.nvim-lightbulb").setup()
require("plugins.vim-yoink").setup()
require("plugins.nvim-spectre").setup()
require("plugins.dap").setup()

map("n", "S", ":ISwapWith<CR>", { silent = true })
require("iswap").setup({
  -- The keys that will be used as a selection, in order
  keys = "jkiop",
  -- Grey out the rest of the text when making a selection
  grey = "enabled",
  -- Highlight group for the sniping value (asdf etc.)
  hl_snipe = "LightspeedUnlabeledMatch",
  -- Highlight group for the visual selection of terms
  hl_selection = "Comment",
  -- Automatically swap with only two arguments
  autoswap = true,
})

require("nvim-treesitter.configs").setup({
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/206
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        -- ["af"] = "@function.outer",
        -- ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        -- ["ab"] = "@block.outer",
        -- ["ib"] = "@block.inner",
      },
    },
  },
})
