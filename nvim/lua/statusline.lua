local colors = require("kanagawa.colors").setup()

bg = "#16161d"
local kanagawa = {}

kanagawa.normal = {
  a = { bg = colors.crystalBlue, fg = colors.bg_dark },
  b = { bg = colors.winterBlue, fg = colors.crystalBlue },
  c = { bg = bg, fg = colors.fg },
}

kanagawa.insert = {
  a = { bg = colors.autumnGreen, fg = colors.bg_dark },
  b = { bg = bg, fg = colors.autumnGreen },
}

kanagawa.command = {
  a = { bg = colors.boatYellow2, fg = colors.bg_dark },
  b = { bg = bg, fg = colors.boatYellow2 },
}

kanagawa.visual = {
  a = { bg = colors.oniViolet, fg = colors.bg_dark },
  b = { bg = bg, fg = colors.oniViolet },
}

kanagawa.replace = {
  a = { bg = colors.autumnRed, fg = colors.bg_dark },
  b = { bg = bg, fg = colors.autumnRed },
}

kanagawa.inactive = {
  a = { bg = colors.bg_status, fg = colors.crystalBlue },
  b = { bg = colors.bg_status, fg = colors.fujiGray, gui = "bold" },
  c = { bg = colors.bg_status, fg = colors.fujiGray },
}

if vim.g.kanagawa_lualine_bold then
  for _, mode in pairs(kanagawa) do
    mode.a.gui = "bold"
  end
end

require("lualine").setup({
  extensions = { "nvim-tree", "fzf" },
  options = {
    icons_enabled = false,
    section_separators = "",
    component_separators = "",
    theme = kanagawa,
    -- theme = "auto",
  },
  sections = {
    lualine_c = {
      {
        "filename",
        color = { bg = bg },
      }
    },
    lualine_x = {
      {

        "filetype",
        color = { bg = bg },
      },
    },
    lualine_y = {},
  },
})
