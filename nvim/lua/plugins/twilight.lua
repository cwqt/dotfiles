local M = {}
M.setup = function()
  -- Highlights scope of code, for demoing stuff
  require("twilight").setup({
    dimming = {
      alpha = 0.5,
    },
  })
end
return M
