vim.opt.shortmess = vim.opt.shortmess
  + {
    c = false, -- Do not show completion messages in command line
    F = false, -- Do not show file info when editing a file, in the command line
    W = false, -- Do not show "written" in command line when writing
    I = true, -- Do not show intro message when starting Vim
    a = true,
    s = true, -- Do not show search hit bottom / top messages
  }

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- FIXME: LSP doing something before lsp-zero
vim.g.lsp_zero_extend_lspconfig = 0

vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ' ' -- Same for `maplocalleader`
vim.o.fillchars = 'eob: ' -- -- Hide `~` after end of file
vim.opt.list = true

local oxocarbon = require 'oxocarbon'

require('lazy').setup {
  -- LSP ------------------------------------------------
  { 'neovim/nvim-lspconfig' },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', config = require('plugins.nvim-lsp-zero').setup },
  { 'williamboman/mason.nvim', config = require('plugins.nvim-mason').setup }, -- Manage LSP servers
  { 'williamboman/mason-lspconfig.nvim' },
  -- Garbage collector for hanging LSP clients
  {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
  },
  -- mason null-ls integration
  'nvimtools/none-ls.nvim', -- null-ls formatting engine
  {
    'jayp0521/mason-null-ls.nvim',
    opts = {
      ensure_installed = { 'prettierd', 'stylua' },
      automatic_installation = true,
    },
    config = require('plugins.nvim-null-ls').setup,
  },
  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- lsp source
      'hrsh7th/cmp-vsnip', -- vsnip source
    },
    config = require('plugins.nvim-cmp').config,
  },
  -- snippets
  {
    'hrsh7th/vim-vsnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },
  { 'onsails/lspkind.nvim' }, -- autocomplete icons
  -- syntax aware highlighting/objects
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require 'nvim-treesitter.configs'

      configs.setup {
        ensure_installed = {
          'json',
          'lua',
          'vim',
          'vimdoc',
          'query',
          'typescript',
          'javascript',
          'tsx',
          'html',
          'css',
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 1, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  }, -- function context
  { 'windwp/nvim-ts-autotag', config = true },

  -------------------------------------------------------

  {
    'dnlhc/glance.nvim',
    config = function()
      require('glance').setup {

        hooks = {
          -- Don't open glance when there is only one result instead jump to that location
          before_open = function(results, open, jump, method)
            if #results == 1 then
              jump(results[1]) -- argument is optional
            else
              open(results) -- argument is optional
            end
          end,
        },
      }
    end,
  },

  { 'mhinz/vim-sayonara' }, -- closing / re-opening buffers
  { 'supercrabtree/vim-resurrect' }, -- bring back closed buffers
  { 'nvim-lualine/lualine.nvim', config = require('plugins.lualine').setup }, -- status line
  -- replace cmdline / messages
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      routes = {
        {
          filter = { event = 'msg_show', kind = '', find = 'written' },
          opts = { skip = true },
        },
        {
          filter = { event = 'msg_show', kind = '', find = 'Modified' },
          opts = { skip = true },
        },
        {
          filter = { event = 'msg_show', kind = '', find = 'lines' },
          opts = { skip = true },
        },
        {
          filter = { event = 'msg_show', kind = '', find = '--' },
          opts = { skip = true },
        },
      },
      cmdline = {
        view = 'cmdline',

        -- set IncRename to use command bar
        format = {
          inc_rename = { pattern = '^:%s*IncRename%s+', icon = ' ', ft = 'text' },
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        lsp_doc_border = true, -- add a border to hover docs and signature help
        long_message_to_split = true, -- long messages will be sent to a split
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
    },
  },
  { 'ggandor/lightspeed.nvim' }, -- s navigation
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<A-i>]],
      shade_terminals = false,
      size = 20,
    },
  },
  {
    'petertriho/nvim-scrollbar',
    config = require('plugins.nvim-scrollbar').setup,
  }, -- scrollbar hints
  { 'lewis6991/gitsigns.nvim' }, -- git signs
  { 'kyazdani42/nvim-tree.lua', config = require('plugins.nvim-tree').setup }, -- file tree
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('Comment').setup {
        -- JSX/TSX commenting support within TS/JS
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  }, -- commenting
  { 'tommcdo/vim-exchange' }, -- cxia, swap args
  { 'wellle/targets.vim' }, -- expand on bracket/comma text objects
  { 'folke/todo-comments.nvim' }, -- highlight TODO markers
  { 'mrjones2014/smart-splits.nvim' }, -- better split resizing
  { 'michaeljsmith/vim-indent-object' }, -- indent text objects
  {
    'ruifm/gitlinker.nvim',
    config = function()
      require('gitlinker').setup {
        opts = { print_url = true },
        mappings = '<leader>gy',
      }

      -- Conflict markers
      map('n', ']x', '<cmd>GitConflictNextConflict<CR>')
      map('n', '[x', '<cmd>GitConflictPrevConflict<CR>')
      map('n', '<leader>xo', '<cmd>GitConflictChooseOurs<CR>')
      map('n', '<leader>xt', '<cmd>GitConflictChooseTheirs<CR>')
      map('n', '<leader>xb', '<cmd>GitConflictChooseBoth<CR>')
    end,
  }, -- link to git repos
  { 'folke/which-key.nvim', config = require('plugins.nvim-whichkey').setup }, -- show motions
  { 'tpope/vim-fugitive', config = require('plugins.nvim-fugitive').setup }, -- interactive git
  { 'APZelos/blamer.nvim' }, -- git blame on cursor
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  { 'sindrets/diffview.nvim', config = require('plugins.nvim-diffview').setup }, -- diff view / merge tool
  { 'kosayoda/nvim-lightbulb', config = require('plugins.nvim-code-lightbulb').setup }, -- code action lightbulb
  { 'weilbith/nvim-code-action-menu' }, -- code action menu
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true,
        enable_check_bracket_line = true,
      }
    end,
  }, -- auto insert closing brackets
  { 'wakatime/vim-wakatime' }, -- time tracking
  -- indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      vim.api.nvim_set_hl(0, 'IndentScope', { fg = oxocarbon.colors.grey40, bg = oxocarbon.colors.none })

      require('ibl').setup {
        indent = {
          char = '▏', -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
        },
        scope = {
          highlight = {
            'IndentScope',
          },
        },
      }
    end,
  },
  -- bufferline
  {
    'willothy/nvim-cokeline',
    config = require('plugins.nvim-cokeline').setup,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'ibhagwan/fzf-lua', config = require('plugins.nvim-fzf').setup }, -- fuzzy finder
  -- motions for replacing/changing/deleting objects
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  -- visualise renaming variables
  {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup()
    end,
  },
  -- remember sessions between closing & opening for directoriea
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
      }
    end,
  },
  -- search and replace
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup {
        disableBufferLineNumbers = true,
        icons = {
          enabled = false,
        },
      }
    end,
  },
  -- auto-resize vsplits
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end,
  },
}

local vimrc = vim.fn.stdpath 'config' .. '/vimrc.vim'
vim.cmd.source(vimrc)

vim.opt.background = 'dark' -- set this to dark or light
oxocarbon.setup()

require 'oxocarbon.lualine'

-- fixme: colors
require('plugins.nvim-gitsigns').setup()

require('autocommands').setup()
require('keymaps').setup()
