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

-- Example using a list of specs with the default options
vim.g.mapleader = " "       -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  -- LSP ------------------------------------------------
  { 'VonHeikemen/lsp-zero.nvim',           branch = 'v3.x' },
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- {'hrsh7th/cmp-nvim-lsp'},
  -- {'hrsh7th/nvim-cmp'},
  -- {'L3MON4D3/LuaSnip'},

  "neovim/nvim-lspconfig", -- lsp configurations
  "j-hui/fidget.nvim",     -- lsp loading indicator
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "json", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html", "css" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },                                             --{'do': ':TSUpdate'} -- syntax aware highlighting/objects
  "nvim-treesitter/nvim-treesitter-textobjects", -- tree-sitter powered objects

  -------------------------------------------------------
  "machakann/vim-sandwich",                                             -- operations on text objects
  "kyazdani42/nvim-tree.lua",                                           -- file tree
  "numToStr/Comment.nvim",                                              -- commenting
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",   opts = {} }, -- indentation guides
  "supercrabtree/vim-resurrect",                                        -- bring back closed buffers
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for v0.4.0+
    },
  },                           -- bufferline
  "mhinz/vim-sayonara",        -- closing / re-opening buffers
  "nvim-lualine/lualine.nvim", -- status line

  "mathieupost/nuake",         -- quake terminal
  "petertriho/nvim-scrollbar",
  "lewis6991/gitsigns.nvim",   -- git signs
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
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

require("plugins.nvim-tree").setup()
require("plugins.nvim-cokeline").setup()
require("plugins.lualine").setup()
require("plugins.nvim-scrollbar").setup()
require("plugins.nvim-fzf-lua").setup()
require("plugins.nvim-gitsigns")

vim.opt.background = "dark" -- set this to dark or light
require("oxocarbon")
require("oxocarbon.lualine")


require("fidget").setup({
  integration = { ["nvim-tree"] = { enable = true, }, },
})

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
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

-- closing / re-opening buffers
vim.cmd([[
  " Open and close a buffer
  nnoremap <silent>    <A-n> :enew<CR>
  nnoremap <silent>    <A-w> :Sayonara!<CR>
  nnoremap <silent>    <A-q> :Sayonara<CR>
  " Revive previously closed buffers
  nnoremap <silent>    <A-W> :Resurrect<CR>
]])
