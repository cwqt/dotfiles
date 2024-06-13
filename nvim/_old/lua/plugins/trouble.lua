local map = require("utils.map")

local M = {}

M.setup = function()
  require("trouble").setup({
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
    ":Trouble workspace_diagnostics<CR>",
    { silent = true }
  )
  map("n", "<Leader>xd", ":Trouble document_diagnostics<CR>", {
    silent = true,
  })
  map("n", "<Leader>xq", ":Trouble quickfix<CR>", { silent = true })
  map("n", "<Leader>xl", ":Trouble loclist<CR>", { silent = true })
  map("n", "gR", ":Trouble lsp_references<CR>", { silent = true })
end

return M
