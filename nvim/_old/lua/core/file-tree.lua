local map = require("utils.map")

local M = {}

-- \ 'git': {
-- \   'unstaged': "",
-- \   'staged': "",
-- \   'unmerged': "",
-- \   'renamed': "",
-- \   'untracked': "",
-- \   'deleted': "",
-- \   'ignored': ""
-- \   },

-- \   'arrow_open': "",
-- \   'arrow_closed': "",
--
M.setup = function()
  -- file tree sidebar key binding
  map("n", "<leader>b", ":NvimTreeToggle<CR>", { silent = true })

  vim.cmd([[
  let g:nvim_tree_highlight_opened_files = 2

  let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'symlink': ' ',
      \ 'git': {
      \   'unstaged': "u",
      \   'staged': "s",
      \   'unmerged': "m",
      \   'renamed': "r",
      \   'untracked': "t",
      \   'deleted': "d",
      \   'ignored': "i"
      \   },
      \ 'folder': {
      \   'arrow_open': " ",
      \   'arrow_closed': " ",
      \   'default': "",
      \   'open': "",
      \   'empty': "",
      \   'empty_open': "",
      \   'symlink': "",
      \   'symlink_open': "",
      \   }
      \ }
  ]])

  -- keymaps
  local list = {
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = { "O" }, action = "edit_no_picker" },
    { key = "<A-;>", action = "vsplit" },
    { key = "<A-'>", action = "split" },
    { key = "<A-r>", action = "refresh" },
    { key = "P", action = "parent_node" },
    { key = "<BS>", action = "close_node" },
    { key = "i", action = "toggle_ignored" },
    { key = "h", action = "toggle_dotfiles" },
    { key = "a", action = "create" },
    { key = "d", action = "trash" },
    { key = "r", action = "rename" },
    { key = "R", action = "full_rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
    { key = "[c", action = "prev_git_item" },
    { key = "]c", action = "next_git_item" },
    { key = "-", action = "dir_up" },
    { key = "+", action = "cd" },
    { key = "S", action = "system_open" },
    { key = "?", action = "toggle_help" },
    { key = "C", action = "collapse_all" },
    { key = ".", action = "run_file_command" },
    { key = "t", action = "tabnew" },
    -- { key = "p", action = "preview" },
  }
  require("nvim-tree").setup({
    update_cwd = true,
    diagnostics = {
      enable = false,
    },
    renderer = {
      icons = {
        webdev_colors = false,
        git_placement = "after",
      },
    },
    view = {
      width = 40,
      hide_root_folder = true,
      signcolumn = "no",
      mappings = {
        custom_only = true,
        list = list,
      },
    },
    hijack_cursor = true,
    update_focused_file = {
      enable = true,
    },
  })

  local colors = require("kanagawa.colors").setup()
  vim.cmd(
    "autocmd Colorscheme * highlight! NvimTreeWindowPicker guibg="
      .. colors.sumiInk2
  )

  -- vim.cmd(
  --   "autocmd Colorscheme * highlight! NvimTreeNormalNC guifg=NONE guibg=#080a0d"
  -- )
  -- vim.cmd("autocmd Colorscheme * highlight! NvimTreeNormal guibg=#080a0d")
end

return M
