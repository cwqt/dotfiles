local M = {}

M.setup = function()
  require("spectre").setup({
    line_sep_sstart = "",
    result_padding = "     ",
    line_sep = "",
  })
end

return M
