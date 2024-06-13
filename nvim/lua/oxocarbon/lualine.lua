local oxocarbon = (require 'oxocarbon').colors
local colors = {
  color0 = oxocarbon.grey60,
  color1 = oxocarbon.hotPink,
  color2 = oxocarbon.lightTurquoise,
  color3 = oxocarbon.black,
  color6 = oxocarbon.grey20,
  color7 = oxocarbon.blue,
  color8 = oxocarbon.purple,
  color9 = oxocarbon.lightPink,
  color10 = oxocarbon.green,
}

return {
  replace = { a = { fg = colors.color0, bg = colors.color1 }, b = { fg = colors.color2, bg = colors.color3 } },
  inactive = {
    a = { fg = colors.color0, bg = colors.color7 },
    b = { fg = colors.color6, bg = colors.color3 },
    z = { fg = colors.color0, bg = colors.color3 },
  },
  normal = {
    a = { fg = colors.color0, bg = colors.color7 },
    b = { fg = colors.color6, bg = colors.color3 },
    c = { fg = colors.color6, bg = colors.color3 },
    z = { fg = colors.color6, bg = colors.color3 },
  },
  visual = {
    a = { fg = colors.color0, bg = colors.color8 },
    b = { fg = colors.color6, bg = colors.color3 },
    y = { fg = colors.color6, bg = colors.color3 },
    z = { fg = colors.color9, bg = colors.color3 },
  },
  insert = {
    a = { fg = colors.color0, bg = colors.color9 },
    b = { fg = colors.color6, bg = colors.color3 },
    z = { fg = colors.color9, bg = colors.color3 },
  },
  command = { a = { fg = colors.color0, bg = colors.color10 } },
}
