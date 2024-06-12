vim.opt.shortmess = vim.opt.shortmess + {
  c = false, -- Do not show completion messages in command line
  F = false, -- Do not show file info when editing a file, in the command line
  W = false, -- Do not show "written" in command line when writing
  I = true,  -- Do not show intro message when starting Vim
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- FIXME: LSP doing something before lsp-zero
vim.g.lsp_zero_extend_lspconfig = 0

-- Example using a list of specs with the default options
vim.g.mapleader = " "       -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  -- LSP ------------------------------------------------
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  "onsails/lspkind.nvim",
  'hrsh7th/vim-vsnip',
  'L3MON4D3/LuaSnip',
  "neovim/nvim-lspconfig", -- lsp configurations
  "j-hui/fidget.nvim",     -- lsp loading indicator
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "json", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "tsx", "html", "css" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }, --{'do': ':TSUpdate'} -- syntax aware highlighting/objects
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  "nvim-treesitter/nvim-treesitter-textobjects", -- tree-sitter powered objects

  -------------------------------------------------------

  "mhinz/vim-sayonara",          -- closing / re-opening buffers
  "supercrabtree/vim-resurrect", -- bring back closed buffers
  "nvim-lualine/lualine.nvim",   -- status line
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  "ggandor/lightspeed.nvim",                 -- s navigation
  "mathieupost/nuake",                       -- quake terminal
  "petertriho/nvim-scrollbar",               -- scrollbar hints
  "lewis6991/gitsigns.nvim",                 -- git signs
  "machakann/vim-sandwich",                  -- operations on text objects
  "kyazdani42/nvim-tree.lua",                -- file tree
  "numToStr/Comment.nvim",                   -- commenting
  "tommcdo/vim-exchange",                    -- cxia
  "wellle/targets.vim",                      -- expand on bracket/comma text objects
  "folke/todo-comments.nvim",                -- highlight TODO markers
  "mrjones2014/smart-splits.nvim",           -- better split resizing
  "michaeljsmith/vim-indent-object",         -- indent text objects
  "nvim-treesitter/nvim-treesitter-context", -- function context
  "ruifm/gitlinker.nvim",                    -- link to git repos
  "folke/which-key.nvim",                    -- show motions
  "tpope/vim-fugitive",                      -- interactive git
  "APZelos/blamer.nvim",                     -- git blame on cursor
  "rhysd/conflict-marker.vim",               -- highlight conflict markers
  "sindrets/diffview.nvim",                  -- diff view / merge tool
  "folke/trouble.nvim",                      -- better quickfix menu
  "kosayoda/nvim-lightbulb",                 -- code action lightbulb
  "weilbith/nvim-code-action-menu",          -- code action menu
  "windwp/nvim-ts-autotag",                  -- lsp delete/rename html tags
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  }, -- indentation guides
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for v0.4.0+
    },
  },                           -- bufferline
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        files = {
          header = false,
          no_header_i = true,
        },
        fzf_opts = {
          -- options are sent as `<left>=<right>`
          -- set to `false` to remove a flag
          -- set to `true` for a no-value flag
          -- for raw args use `fzf_args` instead
          ["--ansi"]           = true,
          ["--info"]           = "inline-right",
          ["--height"]         = "100%",
          ["--layout"]         = false,
          ["--border"]         = "none",
          ["--highlight-line"] = true, -- fzf >= v0.53
        },
        winopts = {
          height  = 0.4, -- window height
          width   = 1,   -- window width
          row     = 1,   -- window row position (0=top, 1=bottom)
          col     = 0,   -- window col position (0=left, 1=right)
          border  = "none",
          preview = {
            hidden = "hidden"
          }
        },
      })
    end
  }
})

local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

require("autocommands").setup()
require("keymaps").setup()
require("autocomplete")

require("plugins.nvim-tree").setup()
require("plugins.nvim-code-lightbulb").setup()
require("plugins.nvim-cokeline").setup()
require("plugins.lualine").setup()
require("plugins.nvim-scrollbar").setup()
require("plugins.nvim-fzf-lua").setup()
require("plugins.nvim-gitsigns").setup()
require("plugins.nvim-gitlinker")
require("plugins.nvim-whichkey").setup()
require("plugins.nvim-diffview").setup()
require("plugins.nvim-fugitive").setup()
require("plugins.nvim-trouble").setup()

vim.opt.background = "dark" -- set this to dark or light
require("oxocarbon")
require("oxocarbon.lualine")

require("nvim-autopairs").setup({
  check_ts = true,
  enable_check_bracket_line = true,
})

require("fidget").setup({
  integration = { ["nvim-tree"] = { enable = true, }, },
})

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  local opts = { noremap = true, silent = true }
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Code action menu
  buf_set_keymap("n", "ga", "<Cmd>CodeActionMenu<CR>", opts)
  -- Show signature help, uses <Up> because of karabiner ctrl+k to Up rebinding
  buf_set_keymap("i", "<Up>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<Up>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- Rename symbol under the cursor
  buf_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- Show code references in Trouble
  buf_set_keymap("n", "gr", "<Cmd>Trouble lsp_references<CR>", opts)
  -- Go to code definitions
  buf_set_keymap("n", "gd", "<Cmd>Trouble lsp_definitions<CR>", opts)
  -- Go to error diagnostics with [e and ]e
  buf_set_keymap(
    "n",
    "]e",
    "<cmd>lua vim.diagnostic.goto_next({ float={ border='rounded' }, severity = "
    .. tostring(vim.diagnostic.severity.ERROR)
    .. " })<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "[e",
    "<cmd>lua vim.diagnostic.goto_prev({ float={ border='rounded' }, severity = "
    .. tostring(vim.diagnostic.severity.ERROR)
    .. " })<CR>",
    opts
  )
end)

lsp_zero.format_on_save({
  format_opts = {
    async = true,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
    ['lua_ls'] = { 'lua' },
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "tsserver", "jsonls", },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

-- -- Hide `~` after end of file
vim.o.fillchars = "eob: "
vim.opt.list = true

-- gutter symbols
local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
