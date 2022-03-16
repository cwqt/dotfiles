local M = {}
M.setup = function()
  -- Floating terminal window
  require("FTerm").setup({
    cmd = "/opt/homebrew/bin/fish",
    border = "rounded",
  })

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
  map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
end
return M