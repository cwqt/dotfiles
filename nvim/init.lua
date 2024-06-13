vim.opt.shortmess = vim.opt.shortmess
  + {
    c = false, -- Do not show completion messages in command line
    F = false, -- Do not show file info when editing a file, in the command line
    W = false, -- Do not show "written" in command line when writing
    I = true, -- Do not show intro message when starting Vim
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

-- Example using a list of specs with the default options
vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = '\\' -- Same for `maplocalleader`

local oxocarbon = require 'oxocarbon'

require('lazy').setup {
  -- LSP ------------------------------------------------
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim', -- install lsp servers
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/cmp-nvim-lsp', -- autocomplete
  'hrsh7th/nvim-cmp', -- autocomplete
  'onsails/lspkind.nvim', -- autocomplete icons
  'hrsh7th/vim-vsnip', -- snippets
  'L3MON4D3/LuaSnip', -- snippets
  'neovim/nvim-lspconfig', -- lsp configurations
  'j-hui/fidget.nvim', -- lsp loading indicator
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
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  }, --
  'nvim-treesitter/nvim-treesitter-textobjects', -- tree-sitter powered objects
  'nvimtools/none-ls.nvim', -- null-ls formatting engine
  -- mason null-ls integration
  {
    'jayp0521/mason-null-ls.nvim',
    config = true,
    opts = {
      ensure_installed = { 'prettier_d_slim', 'stylua' },
      automatic_installation = true,
    },
  },

  -------------------------------------------------------

  'mhinz/vim-sayonara', -- closing / re-opening buffers
  'supercrabtree/vim-resurrect', -- bring back closed buffers
  'nvim-lualine/lualine.nvim', -- status line
  -- replace cmdline / messages
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      {
        cmdline = { view = 'cmdline' },
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
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
    },
  },
  'ggandor/lightspeed.nvim', -- s navigation
  'mathieupost/nuake', -- quake terminal
  'petertriho/nvim-scrollbar', -- scrollbar hints
  'lewis6991/gitsigns.nvim', -- git signs
  'machakann/vim-sandwich', -- operations on text objects
  'kyazdani42/nvim-tree.lua', -- file tree
  'rktjmp/lush.nvim',
  'PyGamer0/darc.nvim',
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
  'tommcdo/vim-exchange', -- cxia
  'wellle/targets.vim', -- expand on bracket/comma text objects
  'folke/todo-comments.nvim', -- highlight TODO markers
  'mrjones2014/smart-splits.nvim', -- better split resizing
  'michaeljsmith/vim-indent-object', -- indent text objects
  'nvim-treesitter/nvim-treesitter-context', -- function context
  'ruifm/gitlinker.nvim', -- link to git repos
  'folke/which-key.nvim', -- show motions
  'tpope/vim-fugitive', -- interactive git
  'APZelos/blamer.nvim', -- git blame on cursor
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  'sindrets/diffview.nvim', -- diff view / merge tool
  'folke/trouble.nvim', -- better quickfix menu
  'kosayoda/nvim-lightbulb', -- code action lightbulb
  'weilbith/nvim-code-action-menu', -- code action menu
  {
    'windwp/nvim-ts-autotag',
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      vim.api.nvim_set_hl(
        0,
        'IndentScope',
        { fg = oxocarbon.blend_hex(oxocarbon.colors.hotPink, oxocarbon.colors.black, 0.1), bg = oxocarbon.colors.none }
      )

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
  }, -- indentation guides
  {
    'willothy/nvim-cokeline',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for v0.4.0+
    },
  }, -- bufferline
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {
        grep = {
          prompt = 'fuzzy: ',
          header = false,
          no_header_i = true,
        },
        files = {
          header = false,
          no_header_i = true,
        },
        fzf_opts = {
          -- options are sent as `<left>=<right>`
          -- set to `false` to remove a flag
          -- set to `true` for a no-value flag
          -- for raw args use `fzf_args` instead
          ['--ansi'] = true,
          ['--info'] = 'inline-right',
          ['--height'] = '100%',
          ['--layout'] = false,
          ['--border'] = 'none',
          ['--highlight-line'] = true, -- fzf >= v0.53
        },
        winopts = {
          height = 0.4, -- window height
          width = 1, -- window width
          row = 1, -- window row position (0=top, 1=bottom)
          col = 0, -- window col position (0=left, 1=right)
          border = 'none',
          preview = {
            hidden = 'hidden',
          },
        },
      }
    end,
  },
}

local vimrc = vim.fn.stdpath 'config' .. '/vimrc.vim'
vim.cmd.source(vimrc)

vim.opt.background = 'dark' -- set this to dark or light
oxocarbon.setup()
require 'oxocarbon.lualine'

require('plugins.nvim-tree').setup()
require('plugins.nvim-code-lightbulb').setup()
require('plugins.nvim-cokeline').setup()
require('plugins.lualine').setup()
require('plugins.nvim-scrollbar').setup()
require('plugins.nvim-fzf-lua').setup()
require('plugins.nvim-gitsigns').setup()
require('plugins.nvim-whichkey').setup()
require('plugins.nvim-diffview').setup()
require('plugins.nvim-fugitive').setup()
require('plugins.nvim-trouble').setup()

require('autocommands').setup()
require('keymaps').setup()
require 'autocomplete'
require('git').setup()

require('nvim-autopairs').setup {
  check_ts = true,
  enable_check_bracket_line = true,
}

require('fidget').setup {
  integration = { ['nvim-tree'] = { enable = true } },
}

local lsp_zero = require 'lsp-zero'
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps { buffer = bufnr }

  local opts = { noremap = true, silent = true }
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Code action menu
  buf_set_keymap('n', 'ga', '<Cmd>CodeActionMenu<CR>', opts)
  -- TS imports
  buf_set_keymap('n', 'gi', '<Cmd>TSToolsAddMissingImports<CR>', opts)
  buf_set_keymap('n', 'go', '<Cmd>TSToolsSortImports<CR>', opts)
  -- Show signature help, uses <Up> because of karabiner ctrl+k to Up rebinding
  buf_set_keymap('i', '<Up>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<Up>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- Rename symbol under the cursor
  buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- Show code references in Trouble
  buf_set_keymap('n', 'gr', '<Cmd>Trouble lsp_references<CR>', opts)
  -- Go to code definitions
  buf_set_keymap('n', 'gd', '<Cmd>Trouble lsp_definitions<CR>', opts)
  -- Go to error diagnostics with [e and ]e
  buf_set_keymap(
    'n',
    ']e',
    "<cmd>lua vim.diagnostic.goto_next({ float={ border='rounded' }, severity = "
      .. tostring(vim.diagnostic.severity.ERROR)
      .. ' })<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '[e',
    "<cmd>lua vim.diagnostic.goto_prev({ float={ border='rounded' }, severity = "
      .. tostring(vim.diagnostic.severity.ERROR)
      .. ' })<CR>',
    opts
  )
end)

local null_ls = require 'null-ls'
-- to setup format on save
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local formatting = null_ls.builtins.formatting -- to setup formatters

-- configure null_ls
null_ls.setup {
  offset_encoding = 'utf-8',
  -- setup formatters & linters
  sources = {
    formatting.prettier, -- js/ts formatter
    formatting.stylua, -- lua formatter
  },
  -- configure format on save
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            filter = function(c)
              --  only use null-ls for formatting instead of lsp server
              return c.name == 'null-ls'
            end,
            bufnr = bufnr,
          }
        end,
      })
    end
  end,
}

-- lsp_zero.format_on_save({
--   format_opts = {
--     async = true,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['null-ls'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
--     ['lua_ls'] = { 'lua' },
--   }
-- })

require('mason').setup {}
require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls', 'tsserver', 'jsonls' },
  automatic_installation = true,
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup {}
    end,
  },
}

-- -- Hide `~` after end of file
vim.o.fillchars = 'eob: '
vim.opt.list = true

-- gutter symbols
local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = '',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
