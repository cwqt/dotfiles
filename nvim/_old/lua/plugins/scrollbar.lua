local M = {}

M.setup = function()
  local colors = require("kanagawa.colors").setup({
    transparent = true,
    undercurl = true,
    dimInactive = true,
  })

  require("scrollbar").setup({
    excluded_filetypes = {
      "NvimTree",
    },
    handle = {
      color = colors.sumiInk1,
    },
    marks = {
      Search = { color = colors.lightBlue },
      Error = { color = colors.samuraiRed },
      Warn = { color = colors.roninYellow },
      Info = { color = colors.waveAqua1 },
      Hint = { color = colors.dragonBlue },
      Misc = { color = colors.oniViolet },
    },
  })
end

return M
