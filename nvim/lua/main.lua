local lsp = require("lspconfig")
require("filetype").setup({})
require("goto-preview").setup({
  width = 80,
})
require("treesitter-context").setup({})
require("gitlinker").setup({
  opts = {
    print_url = false,
  },
  mappings = "<leader>gy",
})
require("neogit").setup({
  kind = "split",
  integrations = {
    diffview = true,
  },
  signs = {
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
})

require("fidget").setup({
  text = {
    spinner = "dots",
  },
  window = {
    relative = "win", -- where to anchor, either "win" or "editor"
    blend = 0, -- &winblend for the window
    zindex = nil, -- the zindex value for the window
  },
})

require("FTerm").setup({
  cmd = "/opt/homebrew/bin/fish",
  border = "rounded",
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- Remove/add terminal padding when entering/leaving vim
vim.cmd([[
augroup kitty_mp
    autocmd!
    autocmd VimLeave * :silent !kitty @ set-spacing padding=15 margin=0
    autocmd VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
augroup END
]])

-- File sidebar ------------------------------------------------------------
require("nvim-tree").setup({
  auto_close = true,
  diagnostics = {
    enable = true,
  },
  view = {
    width = 40,
    hide_root_folder = true,
  },
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
  },
})

-- vim.cmd(
--   "autocmd Colorscheme * highlight NvimTreeNormal guibg=#21252B guifg=#9da5b3"
-- )

local colors = require("kanagawa.colors").setup({
  transparent = true,
  undercurl = true,
  dimInactive = true,
})

require("scrollbar").setup({
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

-- TODO FIXME comments highlighting -------------------------------------------
require("todo-comments").setup({})
require("indent_blankline").setup({
  use_treesitter = true,
  buftype_exclude = { "terminal", "prompt", "nofile", "help" },
  filetype_exclude = { "lspinfo", "startify" },
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
  space_char_blankline = " ",
})
-- Commenting -----------------------------------------------------------------
require("Comment").setup({
  pre_hook = function(ctx)
    local U = require("Comment.utils")

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location =
        require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring({
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    })
  end,
})

-- Status bar -----------------------------------------------------------------
require("statusline")

-- Language Server Protocol ----------------------------------------------------------------------------
Border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "ga", "<Cmd>CodeActionMenu<CR>", opts)

  -- buf_set_keymap("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap(
    "n",
    "gr",
    "<Cmd>TroubleToggle lsp_references<CR>",
    -- "<Cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "ge",
    "<Cmd>lua vim.diagnostic.open_float(0, { scope='line', border='rounded', focusable=false})<CR>",
    opts
  )
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap(
    "n",
    "<C-k>",
    "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
    opts
  )

  buf_set_keymap("n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- error diagnostic ]e
  e = tostring(vim.diagnostic.severity.ERROR)
  buf_set_keymap(
    "n",
    "]e",
    "<cmd>lua vim.diagnostic.goto_next({ float={ border='rounded' }, severity = "
      .. e
      .. " })<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "[e",
    "<cmd>lua vim.diagnostic.goto_prev({ float={ border='rounded' }, severity = "
      .. e
      .. " })<CR>",
    opts
  )
  -- general error d]
  buf_set_keymap(
    "n",
    "]d",
    "<cmd>lua vim.diagnostic.goto_next({ float={ border='rounded' } })<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "[d",
    "<cmd>lua vim.diagnostic.goto_prev({ float={ border='rounded' } })<CR>",
    opts
  )

  local lsp_signature = require("lsp_signature")
  if lsp_signature then
    lsp_signature.on_attach({
      bind = true,
      floating_window = true,
      floating_window_above_cur_line = true,
      hint_enable = false,
      handler_opts = {
        border = "rounded",
      },
    }, bufnr)
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    update_in_insert = false,
    signs = true,
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = "",
    },
  }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "rounded",
  }
)

-- show lightbulb
vim.cmd(
  [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
)

require("nvim-ts-autotag").setup()
local with_autocomplete = require("autocomplete")
for server, configure in pairs({
  efm = require("lsp.efm"),
  sumneko_lua = require("lsp.lua"),
  tsserver = require("lsp.ts"),
  gopls = require("lsp.go"),
  prismals = require("lsp.prisma"),
  jsonls = require("lsp.json"),
}) do
  lsp[server].setup(with_autocomplete(configure(on_attach)))
end

-- Tree sitter -------------------------------------------------
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss",
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

vim.o.fillchars = "eob: "

vim.cmd("autocmd ColorScheme * hi Normal guibg=none")
vim.cmd("autocmd ColorScheme * hi StatusLine gui=none guifg=#eeeeee")
vim.cmd("autocmd ColorScheme * hi VertSplit gui=none guibg=none guifg=#222222")
vim.cmd("autocmd ColorScheme * hi LspWarning guifg=#f8981c guibg=#14191f")
vim.cmd("autocmd ColorScheme * hi LspError guifg=#c41111 guibg=#14191f")

vim.opt.list = true

require("indent_blankline").setup({
  show_current_context = true,
  show_current_context_start = true,
})

-- trouble
require("trouble").setup({
  icons = false,
  padding = false,
})
-- git Diff view -------------------------------------------------------------------------------
local cb = require("diffview.config").diffview_callback

require("diffview").setup({
  diff_binaries = false, -- Show diffs for binaries
  enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = false, -- Requires nvim-web-devicons
  icons = {
    -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "bottom", -- One of 'left', 'right', 'top', 'bottom'
    width = 35, -- Only applies when position is 'left' or 'right'
    height = 10, -- Only applies when position is 'top' or 'bottom'
    listing_style = "list", -- One of 'list' or 'tree'
    tree_options = {
      -- Only applies when listing_style is 'tree'
      flatten_dirs = true, -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
    },
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
      max_count = 256, -- Limit the number of commits
      follow = false, -- Follow renames (only for single file)
      all = false, -- Include all refs under 'refs/' including HEAD
      merges = false, -- List only merge commits
      no_merges = false, -- List no merge commits
      reverse = false, -- List commits in reverse order
    },
  },
  default_args = {
    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {}, -- See ':h diffview-config-hooks'
  key_bindings = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
      ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
      ["gf"] = cb("goto_file"), -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
      ["<C-w>gf"] = cb("goto_file_tab"), -- Open the file in a new tabpage
      ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
      ["<down>"] = cb("next_entry"),
      ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
      ["<up>"] = cb("prev_entry"),
      ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
      ["o"] = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"] = cb("stage_all"), -- Stage all entries.
      ["U"] = cb("unstage_all"), -- Unstage all entries.
      ["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
      ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      ["gf"] = cb("goto_file"),
      ["<C-w><C-f>"] = cb("goto_file_split"),
      ["<C-w>gf"] = cb("goto_file_tab"),
      ["i"] = cb("listing_style"), -- Toggle between 'list' and 'tree' views
      ["f"] = cb("toggle_flatten_dirs"), -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files"),
    },
    file_history_panel = {
      ["g!"] = cb("options"), -- Open the option panel
      ["<C-A-d>"] = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
      ["y"] = cb("copy_hash"), -- Copy the commit hash of the entry under the cursor
      ["zR"] = cb("open_all_folds"),
      ["zM"] = cb("close_all_folds"),
      ["j"] = cb("next_entry"),
      ["<down>"] = cb("next_entry"),
      ["k"] = cb("prev_entry"),
      ["<up>"] = cb("prev_entry"),
      ["<cr>"] = cb("select_entry"),
      ["o"] = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      ["gf"] = cb("goto_file"),
      ["<C-w><C-f>"] = cb("goto_file_split"),
      ["<C-w>gf"] = cb("goto_file_tab"),
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"] = cb("close"),
    },
  },
})

require("gitsigns").setup({
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "┃" },
    topdelete = { text = "┃" },
    changedelete = { text = "┃" },
  },
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend(
        "force",
        { noremap = true, silent = true },
        opts or {}
      )
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map(
      "n",
      "]h",
      "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
      { expr = true }
    )
    map(
      "n",
      "[h",
      "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
      { expr = true }
    )

    map("n", "hp", "<cmd>Gitsigns preview_hunk<CR>")
    map("n", "hd", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")
  end,
})
