local map = require("utils.map")

local M = {}

M.setup = function()
  require("trouble").setup({
    icons = false,
    padding = false,
    auto_jump = { "lsp_implementations", "lsp_definitions" },
    action_keys = {
      jump = { "<cr>" },
    },
  })

  map("n", "<Leader>xx", ":TroubleToggle<CR>", { silent = true })
  map(
    "n",
    "<Leader>xw",
    ":TroubleToggle workspace_diagnostics<CR>",
    { silent = true }
  )
  map(
    "n",
    "<Leader>xd",
    ":TroubleToggle document_diagnostics<CR>",
    { silent = true }
  )
  map("n", "<Leader>xq", ":TroubleToggle quickfix<CR>", { silent = true })
  map("n", "<Leader>xl", ":TroubleToggle loclist<CR>", { silent = true })
  map("n", "gR", ":TroubleToggle lsp_references<CR>", { silent = true })
end

return M
