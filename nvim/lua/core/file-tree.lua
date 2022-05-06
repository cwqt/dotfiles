local map = require("utils.map")

local M = {}

--
M.setup = function()
  -- file tree sidebar key binding
  map("n", "<leader>b", ":NvimTreeToggle<CR>", { silent = true })

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

  -- keymaps
  local list = {
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = { "O" }, action = "edit_no_picker" },
    { key = "<A-;>", action = "vsplit" },
    { key = "<A-'>", action = "split" },
    { key = "<", action = "prev_sibling" },
    { key = ">", action = "next_sibling" },
    { key = "P", action = "parent_node" },
    { key = "<BS>", action = "close_node" },
    { key = "i", action = "toggle_ignored" },
    { key = "h", action = "toggle_dotfiles" },
    { key = "r", action = "refresh" },
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
    { key = "S", action = "system_open" },
    { key = "?", action = "toggle_help" },
    { key = "C", action = "collapse_all" },
    { key = ".", action = "run_file_command" },
    -- { key = "q", action = "close" },
    -- { key = "d", action = "remove" },
    -- { key = "S", action = "search_node" },
    -- { key = "<C-k>", action = "toggle_file_info" },
    -- { key = "<C-e>", action = "edit_in_place" },
    -- { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
    -- { key = "<C-t>", action = "tabnew" },
    -- { key = "<Tab>", action = "preview" },
    -- { key = "K", action = "first_sibling" },
    -- { key = "J", action = "last_sibling" },
  }
  require("nvim-tree").setup({
    diagnostics = {
      enable = false,
    },
    view = {
      width = 40,
      hide_root_folder = true,
      signcolumn = "yes",
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

  vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=#0b0d11")
end

return M
