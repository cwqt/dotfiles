local M = {}

M.setup = function()
  require('mason').setup {}
  require('mason-lspconfig').setup {
    ensure_installed = { 'lua_ls', 'jsonls', 'tsserver' },
    automatic_installation = true,
    handlers = {
      function(server_name)
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
end

return M
