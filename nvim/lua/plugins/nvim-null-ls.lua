local M = {}

M.setup = function()
  local null_ls = require 'null-ls'

  -- to setup format on save
  local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

  null_ls.setup {
    offset_encoding = 'utf-8',
    sources = {
      null_ls.builtins.formatting.prettierd, -- JS/TS
      null_ls.builtins.formatting.stylua, -- Lua
    },
    -- Configure format on save
    on_attach = function(client, bufnr)
      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format {
              filter = function(c)
                --  only use null-ls for formatting instead of LSP provider
                return c.name == 'null-ls'
              end,
              bufnr = bufnr,
            }
          end,
        })
      end
    end,
  }
end

return M
