local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  picker = {
    hidden = false,
  },
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--no-ignore",
      "--smart-case",
      -- "--hidden",
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = " ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.4,
      },
      vertical = {
        mirror = true,
      },
      width = 0.8,
      height = 0.8,
      preview_cutoff = 100,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "dist/",
      "yarn.lock",
      "package.lock.json",
      ".next/",
      ".build/",
    },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "absolute" },
    winblend = 0,
    border = {},
    borderchars = { "" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
        ["<A-w>"] = require("telescope.actions").delete_buffer,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

telescope.load_extension("fzf")

-- map(
--   "n",
--   "<Leader>f",
--   ":Telescope live_grep previewer=false<CR>",
--   { silent = true }
-- )
map(
  "n",
  "<Leader>p",
  ":Telescope find_files hidden=true<CR>",
  { silent = true }
)

-- map("n", "<Leader>b", ":Telescope buffers hidden=true<CR>", { silent = true })
