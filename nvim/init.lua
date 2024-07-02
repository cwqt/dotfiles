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

vim.opt.shortmess:append { W = true, I = true, c = true, a = true, s = true }

local oxocarbon = require 'oxocarbon'

require('lazy').setup {
  -- LSP ------------------------------------------------
  'neovim/nvim-lspconfig',
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  'nvimtools/none-ls.nvim', -- null-ls formatting engine
  'williamboman/mason.nvim', -- install lsp servers
  'williamboman/mason-lspconfig.nvim',
  {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
  },
  -- mason null-ls integration
  {
    'jayp0521/mason-null-ls.nvim',
    config = true,
    opts = {
      ensure_installed = { 'prettierd', 'stylua' },
      automatic_installation = true,
    },
  },
  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- lsp source
      'hrsh7th/cmp-vsnip', -- vsnip source
    },
  },
  -- snippets
  {
    'hrsh7th/vim-vsnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },
  'onsails/lspkind.nvim', -- autocomplete icons
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
  -- {
  --   'pmizio/typescript-tools.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  --   ft = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  --   opts = {},
  -- }, --
  'nvim-treesitter/nvim-treesitter-context', -- function context
  { 'windwp/nvim-ts-autotag', config = true },

  -------------------------------------------------------
  ---
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

  'mhinz/vim-sayonara', -- closing / re-opening buffers
  'supercrabtree/vim-resurrect', -- bring back closed buffers
  'nvim-lualine/lualine.nvim', -- status line
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
  'ggandor/lightspeed.nvim', -- s navigation
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<A-i>]],
      shade_terminals = false,
      size = 20,
    },
  },
  { 'petertriho/nvim-scrollbar', opts = { marks = { Cursor = { text = ' ', highlight = 'CursorColumn' } } } }, -- scrollbar hints
  'lewis6991/gitsigns.nvim', -- git signs
  'kyazdani42/nvim-tree.lua', -- file tree
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
  'tommcdo/vim-exchange', -- cxia, swap args
  'wellle/targets.vim', -- expand on bracket/comma text objects
  'folke/todo-comments.nvim', -- highlight TODO markers
  'mrjones2014/smart-splits.nvim', -- better split resizing
  'michaeljsmith/vim-indent-object', -- indent text objects
  'ruifm/gitlinker.nvim', -- link to git repos
  'folke/which-key.nvim', -- show motions
  'tpope/vim-fugitive', -- interactive git
  'APZelos/blamer.nvim', -- git blame on cursor
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  'sindrets/diffview.nvim', -- diff view / merge tool
  'kosayoda/nvim-lightbulb', -- code action lightbulb
  'weilbith/nvim-code-action-menu', -- code action menu
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true }, -- auto insert closing brackets
  'wakatime/vim-wakatime', -- time tracking
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
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for v0.4.0+
    },
  },
  -- fuzzy finder
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
  -- motions for replacing/changing/deleting objects
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
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

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<A-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

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

require('autocommands').setup()
require('keymaps').setup()
require 'autocomplete'
require('git').setup()

require('nvim-autopairs').setup {
  check_ts = true,
  enable_check_bracket_line = true,
}

local lsp_zero = require 'lsp-zero'
lsp_zero.on_attach(function(_, bufnr)
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
  buf_set_keymap('n', '<leader>gi', '<Cmd>TSToolsAddMissingImports<CR>', opts)
  buf_set_keymap(
    'n',
    'go',
    '<Cmd>lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}}) <CR>',
    opts
  )

  -- Show signature help, uses <Up> because of karabiner ctrl+k to Up rebinding
  buf_set_keymap('i', '<Up>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<Up>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- Rename symbol under the cursor
  -- buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '<leader>rn', ':IncRename ')
  -- Show code references in Trouble
  buf_set_keymap('n', 'gr', '<Cmd>Glance references<CR>', opts)
  -- Go to code definitions
  buf_set_keymap('n', 'gd', '<Cmd>Glance definitions<CR>', opts)
  -- Go to code definitions
  buf_set_keymap('n', 'gi', '<Cmd>Glance implementations<CR>', opts)
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
    formatting.prettierd, -- js/ts formatter
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
  ensure_installed = { 'lua_ls', 'jsonls', 'tsserver' },
  automatic_installation = true,
  handlers = {
    function(server_name)
      -- FIXME: typescript-tools blows
      -- if server_name == 'tsserver' then
      --   return
      -- end

      local opts = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = { globals = { 'vim', 'require' } },
              -- Make the server aware of Neovim runtime files
              workspace = { library = vim.api.nvim_get_runtime_file('', true) },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = { enable = false },
            },
          },
        },
      }

      require('lspconfig')[server_name].setup(opts[server_name] or {})
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
