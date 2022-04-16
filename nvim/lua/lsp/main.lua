local lsp = require("lspconfig")

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>TroubleToggle lsp_definitions<CR>", opts)
  buf_set_keymap("n", "ga", "<Cmd>CodeActionMenu<CR>", opts)

  -- buf_set_keymap("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gi", "<Cmd>TroubleToggle lsp_implementations<CR>", opts)
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

  --   vim.keymap.set("i", "<c-w>", function()
  --   vim.lsp.buf.signature_help()
  -- end, { buffer = true })
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  --   vim.lsp.handlers["signature_help"],
  --   {
  --     border = "single",
  --     close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
  --   }
  -- )

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

  -- local lsp_signature = require("lsp_signature")
  -- if lsp_signature then
  --   lsp_signature.on_attach({
  --     bind = true,
  --     floating_window = true,
  --     floating_window_above_cur_line = true,
  --     hint_enable = false,
  --     handler_opts = {
  --       border = "rounded",
  --     },
  --   }, bufnr)
  -- end
end

local M = {}

local map = require("utils.map")
M.setup = function()
  map("n", "<leader>rl", ":LspRestart<CR>", { silent = true })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      update_in_insert = false,
      signs = true,
      underline = true,
      severity_sort = true,
      virtual_text = {
        spacing = 4,
        prefix = "",
      },
    }
  )

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
  )

  local with_autocomplete = require("lsp.autocomplete")

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

  -- LSP loading indicator
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

  -- LSP colors
  vim.cmd("autocmd ColorScheme * hi Normal guibg=none")
  vim.cmd("autocmd ColorScheme * hi StatusLine gui=none guifg=#eeeeee")
  vim.cmd(
    "autocmd ColorScheme * hi VertSplit gui=none guibg=none guifg=#222222"
  )
  vim.cmd("autocmd ColorScheme * hi LspWarning guifg=#f8981c guibg=#14191f")
  vim.cmd("autocmd ColorScheme * hi LspError guifg=#c41111 guibg=#14191f")

  -- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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
end

return M
