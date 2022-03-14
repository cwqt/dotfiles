local M = {}

--
M.setup = function()
  vim.cmd([[
  let g:nvim_tree_highlight_opened_files = 2

  let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'symlink': '',
      \ 'git': {
      \   'unstaged': "",
      \   'staged': "",
      \   'unmerged': "",
      \   'renamed': "",
      \   'untracked': "",
      \   'deleted': "",
      \   'ignored': ""
      \   },
      \ 'folder': {
      \   'arrow_open': "",
      \   'arrow_closed': "",
      \   'default': "",
      \   'open': "",
      \   'empty': "",
      \   'empty_open': "",
      \   'symlink': "",
      \   'symlink_open': "",
      \   }
      \ }
  ]])

  require("nvim-tree").setup({
    auto_close = true,
    diagnostics = {
      enable = true,
      icons = {
        hint = "┃",
        info = "┃",
        warning = "┃",
        error = "┃",
        -- hint = "",
        -- info = "",
        -- warning = "",
        -- error = "",
      },
    },
    view = {
      width = 40,
      hide_root_folder = true,
      signcolumn = "yes",
    },
    hijack_cursor = true,
    update_focused_file = {
      enable = true,
    },
  })

  -- vim.cmd(
  --   "autocmd Colorscheme * highlight NvimTreeNormal guibg=#21252B guifg=#9da5b3"
  -- )
end

return M
