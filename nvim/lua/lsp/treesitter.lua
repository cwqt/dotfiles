local M = {}

M.setup = function ()
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
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          -- ["ab"] = "@block.outer",
          -- ["ib"] = "@block.inner",
        },
      },
    },
  })
end

return M
