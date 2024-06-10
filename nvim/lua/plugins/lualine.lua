local background = "#16161d"

local M = {}

M.setup = function()
  local oxocarbon = require("oxocarbon.lualine")

  require("lualine").setup({
    extensions = {
      "nvim-tree",
      "fzf",
      "fugitive",
    },
    options = {
      icons_enabled = false,
      component_separators = "",
      theme = oxocarbon,
      disabled_filetypes = { "DiffviewFiles", "fzf", "DiffviewFileHistory" },
      -- section_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = string.lower,
        },
      },
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          color = { bg = background },
        },
      },
      lualine_x = {
        {
          "filetype",
          color = { bg = background },
        },
      },
      lualine_y = {
        "diff",
        "branch",
      },
    },
  })
end

return M
