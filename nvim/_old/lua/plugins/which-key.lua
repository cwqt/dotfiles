local M = {}
M.setup = function()
  -- abuse which key to m -- show help message on the command line when the popup is visibleake our timeoutlen of 0 work
  -- so that things like fzf/toggleterm react instantly
  require("which-key").setup({})
end
return M
