local M = {}
M.setup = function()
  require("indent_blankline").setup({
    use_treesitter = true,
    buftype_exclude = { "terminal", "prompt", "nofile", "help" },
    filetype_exclude = { "lspinfo", "startify" },
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
  })
end
return M
