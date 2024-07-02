local M = {}

M.setup = function()
  -- LSP gutter symbols
  for _, type in pairs { 'Error', 'Warn', 'Hint', 'Info' } do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = '', texthl = hl, numhl = hl })
  end

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
end

return M
