local _local_1_ = require 'oxocarbon.colorutils'
local blend_hex = _local_1_['blend-hex']
if vim.g.colors_name then
  vim.cmd.hi 'clear'
else
end
vim.g['colors_name'] = 'oxocarbon'
vim.o['termguicolors'] = true
local base00 = '#161616'
local base06 = '#ffffff'
local base09 = '#78a9ff'
local oxocarbon = (
  (
    (vim.o.background == 'dark')
    and {
      black = base00,
      grey80 = blend_hex(base00, base06, 0.085),
      grey60 = blend_hex(base00, base06, 0.18),
      grey40 = blend_hex(base00, base06, 0.3),
      grey20 = blend_hex(base00, base06, 0.82),
      grey0 = blend_hex(base00, base06, 0.95),
      white = base06,
      turquoise = '#08bdba',
      lightTurquoise = '#3ddbd9',
      blue = base09,
      hotPink = '#ee5396',
      offBlue = '#33b1ff',
      lightPink = '#ff7eb6',
      green = '#42be65',
      purple = '#be95ff',
      lightBlue = '#82cfff',
      background = '#131313',
      yellow = '#e3b22d',
      none = 'NONE',
    }
  )
  or {
    base00 = base06,
    base01 = blend_hex(base00, base06, 0.95),
    base02 = blend_hex(base00, base06, 0.82),
    base03 = base00,
    base04 = '#37474F',
    base05 = '#90A4AE',
    base06 = '#525252',
    base07 = '#08bdba',
    base08 = '#ff7eb6',
    base09 = '#ee5396',
    base10 = '#FF6F00',
    base11 = '#0f62fe',
    base12 = '#673AB7',
    base13 = '#42be65',
    base14 = '#be95ff',
    base15 = '#FFAB91',
    blend = '#FAFAFA',
    none = 'NONE',
  }
)
do
end

local function setup()
  vim.g['terminal_color_0'] = oxocarbon.grey80
  vim.g['terminal_color_1'] = oxocarbon.offBlue
  vim.g['terminal_color_2'] = oxocarbon.purple
  vim.g['terminal_color_3'] = oxocarbon.green
  vim.g['terminal_color_4'] = oxocarbon.blue
  vim.g['terminal_color_5'] = oxocarbon.lightBlue
  vim.g['terminal_color_6'] = oxocarbon.lightTurquoise
  vim.g['terminal_color_7'] = oxocarbon.grey0
  vim.g['terminal_color_8'] = oxocarbon.grey40
  vim.g['terminal_color_9'] = oxocarbon.offBlue
  vim.g['terminal_color_10'] = oxocarbon.purple
  vim.g['terminal_color_11'] = oxocarbon.green
  vim.g['terminal_color_12'] = oxocarbon.blue
  vim.g['terminal_color_13'] = oxocarbon.lightBlue
  vim.g['terminal_color_14'] = oxocarbon.turquoise
  vim.g['terminal_color_15'] = oxocarbon.white
  vim.api.nvim_set_hl(0, 'ColorColumn', { fg = oxocarbon.none, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'Cursor', { fg = oxocarbon.black, bg = oxocarbon.grey20 })
  vim.api.nvim_set_hl(0, 'CursorLine', { fg = oxocarbon.none, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'CursorColumn', { fg = oxocarbon.none, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'QuickFixLine', { fg = oxocarbon.none, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'Error', { fg = oxocarbon.hotPink, bg = oxocarbon.grey80, underline = true })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = oxocarbon.grey40, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'NonText', { fg = oxocarbon.grey60, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Normal', { fg = oxocarbon.grey20, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'Pmenu', { fg = oxocarbon.grey20, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'PmenuSbar', { fg = oxocarbon.grey20, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'PmenuSel', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'PmenuThumb', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'SpecialKey', { fg = oxocarbon.grey40, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Visual', { fg = oxocarbon.none, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'VisualNOS', { fg = oxocarbon.none, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'TooLong', { fg = oxocarbon.none, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'Debug', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Macro', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'MatchParen', { fg = oxocarbon.none, bg = oxocarbon.grey60, underline = true })
  vim.api.nvim_set_hl(0, 'Bold', { fg = oxocarbon.none, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, 'Italic', { fg = oxocarbon.none, bg = oxocarbon.none, italic = true })
  vim.api.nvim_set_hl(0, 'Underlined', { fg = oxocarbon.none, bg = oxocarbon.none, underline = true })
  vim.api.nvim_set_hl(0, 'DiagnosticWarn', { link = 'Comment' })
  vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = oxocarbon.hotPink, bg = oxocarbon.none })

  vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = oxocarbon.grey20, bg = oxocarbon.none, undercurl = true })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = oxocarbon.hotPink, bg = oxocarbon.none, undercurl = true })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = oxocarbon.grey20, bg = oxocarbon.none, undercurl = true })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = oxocarbon.grey20, bg = oxocarbon.none, undercurl = true })
  vim.api.nvim_set_hl(0, 'HealthError', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'HealthWarning', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'HealthSuccess', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@comment', { link = 'Comment' })
  vim.api.nvim_set_hl(0, '@text.literal.commodity', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@number', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@number.date', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@number.date.effective', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@number.interval', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@number.status', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@number.quantity', { fg = oxocarbon.offBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@number.quantity.negative', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'LspReferenceText', { fg = oxocarbon.none, bg = oxocarbon.grey40 })
  vim.api.nvim_set_hl(0, 'LspReferenceread', { fg = oxocarbon.none, bg = oxocarbon.grey40 })
  vim.api.nvim_set_hl(0, 'LspReferenceWrite', { fg = oxocarbon.none, bg = oxocarbon.grey40 })
  vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@lsp.type.class', { link = 'Structure' })
  vim.api.nvim_set_hl(0, '@lsp.type.decorator', { link = 'Decorator' })
  vim.api.nvim_set_hl(0, '@lsp.type.function', { link = '@function' })
  vim.api.nvim_set_hl(0, '@lsp.type.macro', { link = 'Macro' })
  vim.api.nvim_set_hl(0, '@lsp.type.method', { link = '@function' })
  vim.api.nvim_set_hl(0, '@lsp.type.struct', { link = 'Structure' })
  vim.api.nvim_set_hl(0, '@lsp.type.type', { link = 'Type' })
  vim.api.nvim_set_hl(0, '@lsp.type.typeParameter', { link = 'Typedef' })
  vim.api.nvim_set_hl(0, '@lsp.type.selfParameter', { link = '@variable.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.type.builtinConstant', { link = '@constant.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.type.magicFunction', { link = '@function.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.type.boolean', { link = '@boolean' })
  vim.api.nvim_set_hl(0, '@lsp.type.builtinType', { link = '@type.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.type.comment', { link = '@comment' })
  vim.api.nvim_set_hl(0, '@lsp.type.enum', { link = '@type' })
  vim.api.nvim_set_hl(0, '@lsp.type.enumMember', { link = '@constant' })
  vim.api.nvim_set_hl(0, '@lsp.type.escapeSequence', { link = '@string.escape' })
  vim.api.nvim_set_hl(0, '@lsp.type.formatSpecifier', { link = '@punctuation.special' })
  vim.api.nvim_set_hl(0, '@lsp.type.keyword', { link = '@keyword' })
  vim.api.nvim_set_hl(0, '@lsp.type.namespace', { link = '@namespace' })
  vim.api.nvim_set_hl(0, '@lsp.type.number', { link = '@number' })
  vim.api.nvim_set_hl(0, '@lsp.type.operator', { link = '@operator' })
  vim.api.nvim_set_hl(0, '@lsp.type.parameter', { link = '@parameter' })
  vim.api.nvim_set_hl(0, '@lsp.type.property', { link = '@property' })
  vim.api.nvim_set_hl(0, '@lsp.type.selfKeyword', { link = '@variable.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.type.string.rust', { link = '@string' })
  vim.api.nvim_set_hl(0, '@lsp.type.typeAlias', { link = '@type.definition' })
  vim.api.nvim_set_hl(0, '@lsp.type.unresolvedReference', { link = 'Error' })
  vim.api.nvim_set_hl(0, '@lsp.type.variable', { link = '@variable' })
  vim.api.nvim_set_hl(0, '@lsp.mod.readonly', { link = '@constant' })
  vim.api.nvim_set_hl(0, '@lsp.mod.typeHint', { link = 'Type' })
  vim.api.nvim_set_hl(0, '@lsp.mod.builtin', { link = 'Special' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.class.defaultLibrary', { link = '@type.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.enum.defaultLibrary', { link = '@type.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.enumMember.defaultLibrary', { link = '@constant.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.function.defaultLibrary', { link = '@function.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.keyword.async', { link = '@keyword.coroutine' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.macro.defaultLibrary', { link = '@function.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.method.defaultLibrary', { link = '@function.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.operator.injected', { link = '@operator' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.string.injected', { link = '@string' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.operator.controlFlow', { link = '@exception' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.keyword.documentation', { link = 'Special' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.variable.global', { link = '@constant' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.variable.static', { link = '@constant' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.variable.defaultLibrary', { link = 'Special' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.function.builtin', { link = '@function.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.function.readonly', { link = '@method' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })
  vim.api.nvim_set_hl(0, '@lsp.typemod.variable.injected', { link = '@variable' })
  vim.api.nvim_set_hl(0, 'Folded', { fg = oxocarbon.grey60, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'FoldColumn', { fg = oxocarbon.grey80, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'SignColumn', { fg = oxocarbon.grey80, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'Directory', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = oxocarbon.grey80, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'ModeMsg', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'MoreMsg', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Question', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Substitute', { fg = oxocarbon.grey80, bg = oxocarbon.lightTurquoise })
  vim.api.nvim_set_hl(0, 'WarningMsg', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'WildMenu', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'helpHyperTextJump', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'helpSpecial', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'helpHeadline', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'helpHeader', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiffAdded', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiffChanged', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#122f2f', fg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#222a39', fg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiffText', { bg = '#2f3f5c', fg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#361c28', fg = oxocarbon.none })

  vim.api.nvim_set_hl(0, 'IncSearch', { fg = oxocarbon.grey80, bg = oxocarbon.hotPink })
  vim.api.nvim_set_hl(0, 'Search', { fg = oxocarbon.grey80, bg = oxocarbon.lightPink })

  vim.api.nvim_set_hl(0, 'TabLine', { link = 'StatusLineNC' })
  vim.api.nvim_set_hl(0, 'TabLineFill', { link = 'TabLine' })
  vim.api.nvim_set_hl(0, 'TabLineSel', { link = 'StatusLine' })
  vim.api.nvim_set_hl(0, 'Title', { fg = oxocarbon.grey20, bg = oxocarbon.none })

  vim.api.nvim_set_hl(0, 'Boolean', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Character', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Comment', { fg = oxocarbon.grey40, bg = oxocarbon.none, italic = true })
  vim.api.nvim_set_hl(0, 'Conceal', { fg = oxocarbon.none, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Conditional', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Constant', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Decorator', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Define', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Delimeter', { fg = oxocarbon.white, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Exception', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
  vim.api.nvim_set_hl(0, 'Function', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Identifier', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Include', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Keyword', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Label', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Number', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Operator', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'PreProc', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Repeat', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Special', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'SpecialChar', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'SpecialComment', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Statement', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'StorageClass', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'String', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Structure', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Tag', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Todo', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Type', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'Typedef', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'markdownBlockquote', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'markdownBold', { link = 'Bold' })
  vim.api.nvim_set_hl(0, 'markdownItalic', { link = 'Italic' })
  vim.api.nvim_set_hl(0, 'markdownBoldItalic', { fg = oxocarbon.none, bg = oxocarbon.none, bold = true, italic = true })
  vim.api.nvim_set_hl(0, 'markdownRule', { link = 'Comment' })
  vim.api.nvim_set_hl(0, 'markdownH1', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'markdownH2', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'markdownH3', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'markdownH4', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'markdownH5', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'markdownH6', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'markdownHeadingRule', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'markdownUrl', { fg = oxocarbon.purple, bg = oxocarbon.none, underline = true })
  vim.api.nvim_set_hl(0, 'markdownCode', { link = 'String' })
  vim.api.nvim_set_hl(0, 'markdownCodeBlock', { link = 'markdownCode' })
  vim.api.nvim_set_hl(0, 'markdownCodeDelimiter', { link = 'markdownCode' })
  vim.api.nvim_set_hl(0, 'markdownUrl', { link = 'String' })
  vim.api.nvim_set_hl(0, 'markdownListMarker', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'markdownOrderedListMarker', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'asciidocAttributeEntry', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'asciidocAttributeList', { link = 'asciidocAttributeEntry' })
  vim.api.nvim_set_hl(0, 'asciidocAttributeRef', { link = 'asciidocAttributeEntry' })
  vim.api.nvim_set_hl(0, 'asciidocHLabel', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'asciidocOneLineTitle', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'asciidocQuotedMonospaced', { link = 'markdownBlockquote' })
  vim.api.nvim_set_hl(0, 'asciidocURL', { link = 'markdownUrl' })
  vim.api.nvim_set_hl(0, '@comment', { link = 'Comment' })
  vim.api.nvim_set_hl(0, '@error', { fg = oxocarbon.offBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@operator', { link = 'Operator' })
  vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@punctuation.special', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@string', { link = 'String' })
  vim.api.nvim_set_hl(0, '@string.regex', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@string.escape', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@character', { link = 'Character' })
  vim.api.nvim_set_hl(0, '@boolean', { link = 'Boolean' })
  vim.api.nvim_set_hl(0, '@number', { link = 'Number' })
  vim.api.nvim_set_hl(0, '@float', { link = 'Float' })
  vim.api.nvim_set_hl(0, '@function', { fg = oxocarbon.lightPink, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, '@function.builtin', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@function.macro', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@method', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@constructor', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@parameter', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@keyword', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@keyword.function', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@keyword.operator', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@conditional', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@repeat', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@label', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@include', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@exception', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@type', { link = 'Type' })
  vim.api.nvim_set_hl(0, '@type.builtin', { link = 'Type' })
  vim.api.nvim_set_hl(0, '@attribute', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@field', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@property', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@variable', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@variable.builtin', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@constant', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@constant.builtin', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@constant.macro', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@namespace', { fg = oxocarbon.turquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@symbol', { fg = oxocarbon.lightBlue, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, '@text', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@text.strong', { fg = oxocarbon.none, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@text.emphasis', { fg = oxocarbon.hotPink, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, '@text.underline', { fg = oxocarbon.hotPink, bg = oxocarbon.none, underline = true })
  vim.api.nvim_set_hl(0, '@text.strike', { fg = oxocarbon.hotPink, bg = oxocarbon.none, strikethrough = true })
  vim.api.nvim_set_hl(0, '@text.title', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@text.literal', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@text.uri', { fg = oxocarbon.purple, bg = oxocarbon.none, underline = true })
  vim.api.nvim_set_hl(0, '@tag', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@tag.attribute', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, '@reference', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NvimInternalError', { fg = oxocarbon.black, bg = oxocarbon.lightTurquoise })

  vim.api.nvim_set_hl(0, 'NormalFloat', { fg = oxocarbon.grey0, bg = oxocarbon.background })
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = oxocarbon.grey80, bg = oxocarbon.background })

  vim.api.nvim_set_hl(0, 'NormalNC', { fg = oxocarbon.grey0, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'TermCursor', { fg = oxocarbon.black, bg = oxocarbon.grey20 })
  vim.api.nvim_set_hl(0, 'TermCursorNC', { fg = oxocarbon.black, bg = oxocarbon.grey20 })
  vim.api.nvim_set_hl(0, 'StatusLine', { fg = oxocarbon.grey20, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = oxocarbon.grey20, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'StatusReplace', { fg = oxocarbon.black, bg = oxocarbon.lightTurquoise })
  vim.api.nvim_set_hl(0, 'StatusInsert', { fg = oxocarbon.black, bg = oxocarbon.lightPink })
  vim.api.nvim_set_hl(0, 'StatusVisual', { fg = oxocarbon.black, bg = oxocarbon.purple })
  vim.api.nvim_set_hl(0, 'StatusTerminal', { fg = oxocarbon.black, bg = oxocarbon.offBlue })
  vim.api.nvim_set_hl(0, 'StatusNormal', { fg = oxocarbon.black, bg = oxocarbon.lightBlue })
  vim.api.nvim_set_hl(0, 'StatusCommand', { fg = oxocarbon.black, bg = oxocarbon.green })
  vim.api.nvim_set_hl(0, 'StatusLineDiagnosticWarn', { fg = oxocarbon.purple, bg = oxocarbon.black, bold = true })
  vim.api.nvim_set_hl(0, 'StatusLineDiagnosticError', { fg = oxocarbon.hotPink, bg = oxocarbon.black, bold = true })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = oxocarbon.background, bg = oxocarbon.background })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = oxocarbon.grey60, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = oxocarbon.grey0, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg = oxocarbon.none, bg = oxocarbon.background })
  vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = oxocarbon.grey60, bg = oxocarbon.lightPink })
  vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = oxocarbon.grey60, bg = oxocarbon.offBlue })
  vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = oxocarbon.background, bg = oxocarbon.background })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = oxocarbon.none, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'TelescopePreviewLine', { fg = oxocarbon.none, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(
    0,
    'TelescopeMatching',
    { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none, bold = true, italic = true }
  )
  vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = oxocarbon.grey0, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = oxocarbon.grey0, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = oxocarbon.purple, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = oxocarbon.grey0, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = oxocarbon.green, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = '#adadad', bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = oxocarbon.grey0, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = oxocarbon.grey20, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = oxocarbon.grey20, bg = oxocarbon.none, italic = true })
  vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = oxocarbon.grey80, bg = oxocarbon.lightTurquoise })
  vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = oxocarbon.grey80, bg = oxocarbon.lightTurquoise })
  vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = oxocarbon.grey80, bg = oxocarbon.lightTurquoise })
  vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = oxocarbon.grey80, bg = oxocarbon.blue })
  vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = oxocarbon.grey80, bg = oxocarbon.blue })
  vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = oxocarbon.grey80, bg = oxocarbon.blue })
  vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = oxocarbon.grey80, bg = oxocarbon.hotPink })
  vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = oxocarbon.grey80, bg = oxocarbon.hotPink })
  vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = oxocarbon.grey80, bg = oxocarbon.hotPink })
  vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = oxocarbon.grey80, bg = oxocarbon.offBlue })
  vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = oxocarbon.grey80, bg = oxocarbon.offBlue })
  vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = oxocarbon.grey80, bg = oxocarbon.offBlue })
  vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = oxocarbon.grey80, bg = oxocarbon.offBlue })
  vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = oxocarbon.grey80, bg = oxocarbon.offBlue })
  vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = oxocarbon.grey80, bg = oxocarbon.lightPink })
  vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = oxocarbon.grey80, bg = oxocarbon.lightPink })
  vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = oxocarbon.grey80, bg = oxocarbon.lightPink })
  vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = oxocarbon.grey80, bg = oxocarbon.green })
  vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = oxocarbon.grey80, bg = oxocarbon.green })
  vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = oxocarbon.grey80, bg = oxocarbon.green })
  vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = oxocarbon.grey80, bg = oxocarbon.purple })
  vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = oxocarbon.grey80, bg = oxocarbon.purple })
  vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = oxocarbon.grey80, bg = oxocarbon.lightBlue })
  vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = oxocarbon.grey80, bg = oxocarbon.lightBlue })
  vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = oxocarbon.grey80, bg = oxocarbon.lightBlue })
  vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = oxocarbon.black, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'VertSplit', { fg = oxocarbon.grey20, bg = oxocarbon.black })
  vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = oxocarbon.grey60, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = oxocarbon.lightBlue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  -- vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg = oxocarbon.grey20, bg = oxocarbon.black })

  vim.api.nvim_set_hl(0, 'NvimTreeOpenedHL', { fg = oxocarbon.white, bg = oxocarbon.black, bold = true })
  vim.api.nvim_set_hl(0, 'NvimTreeModified', { fg = oxocarbon.lightPink, bg = oxocarbon.black, bold = true })

  vim.api.nvim_set_hl(0, 'NeogitBranch', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NeogitRemote', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'NeogitHunkHeader', { fg = oxocarbon.grey20, bg = oxocarbon.grey60 })
  vim.api.nvim_set_hl(0, 'NeogitHunkHeaderHighlight', { fg = oxocarbon.grey20, bg = oxocarbon.grey40 })

  vim.api.nvim_set_hl(0, 'HydraRed', { fg = oxocarbon.lightPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'HydraBlue', { fg = oxocarbon.blue, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'HydraAmaranth', { fg = oxocarbon.hotPink, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'HydraTeal', { fg = oxocarbon.lightTurquoise, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'HydraHint', { fg = oxocarbon.none, bg = oxocarbon.background })
  vim.api.nvim_set_hl(0, 'alpha1', { fg = oxocarbon.grey40, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'alpha2', { fg = oxocarbon.grey20, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'alpha3', { fg = oxocarbon.grey40, bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'CodeBlock', { fg = oxocarbon.none, bg = oxocarbon.grey80 })
  vim.api.nvim_set_hl(0, 'BufferLineDiagnostic', { fg = oxocarbon.hotPink, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, 'BufferLineDiagnosticVisible', { fg = oxocarbon.hotPink, bg = oxocarbon.none, bold = true })
  vim.api.nvim_set_hl(0, 'htmlH1', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'mkdRule', { link = 'markdownRule' })
  vim.api.nvim_set_hl(0, 'mkdListItem', { link = 'markdownListMarker' })
  vim.api.nvim_set_hl(0, 'mkdListItemCheckbox', { link = 'markdownListMarker' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader1', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader2', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader3', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader4', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader5', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'VimwikiHeader6', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'VimwikiHeaderChar', { link = 'markdownH1' })
  vim.api.nvim_set_hl(0, 'VimwikiList', { link = 'markdownListMarker' })
  vim.api.nvim_set_hl(0, 'VimwikiLink', { link = 'markdownUrl' })
  vim.api.nvim_set_hl(0, 'VimwikiCode', { link = 'markdownCode' })

  vim.api.nvim_set_hl(0, '@type.tsx', { link = '@tag' })
  vim.api.nvim_set_hl(0, '@tag.builtin.tsx', { link = '@tag' })

  vim.api.nvim_set_hl(0, '@property.json', { link = 'String' })

  vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = blend_hex(oxocarbon.green, base00, 0.3), bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = blend_hex(oxocarbon.yellow, base00, 0.3), bg = oxocarbon.none })
  vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = blend_hex(oxocarbon.hotPink, base00, 0.3), bg = oxocarbon.none })

  vim.cmd 'autocmd WinNew * hi WinSeparator gui=none guibg=none guifg=#222222'
end

return { colors = oxocarbon, blend_hex = blend_hex, setup = setup }
