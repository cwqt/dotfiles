local lsp = require("lspconfig")

-- brew install efm-langserver
-- npm install -g eslint_d
-- npm install -g @fsouza/prettierd
-- npm install -g stylelint

-- local eslint_d = require("efmls-configs.linters.eslint_d")
local prettier_d = require("efmls-configs.formatters.prettier_d")
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local stylelint = require("efmls-configs.linters.stylelint")
local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")
local yamllint = require("efmls-configs.linters.yamllint")
local golines = require("efmls-configs.formatters.golines")
local goimports = require("efmls-configs.formatters.goimports")

local languages = {
  lua = { stylua, luacheck },
  typescript = { prettier_d },
  javascript = { prettier_d },
  typescriptreact = { prettier_d },
  ["typescript.tsx"] = { prettier_d },
  javascriptreact = { prettier_d },
  ["javascript.jsx"] = { prettier_d },
  vue = { prettier_d, stylelint },
  yaml = { prettier_d, yamllint },
  html = { prettier_d },
  less = { prettier_d, stylelint },
  sass = { prettier_d, stylelint },
  scss = { prettier_d, stylelint },
  css = { prettier_d, stylelint },
  markdown = { prettier_d },
  zsh = { shfmt, shellcheck },
  bash = { shfmt, shellcheck },
  sh = { shfmt, shellcheck },
  go = { golines, goimports },
  json = { prettier_d },
}

return function(_)
  return {
    on_attach = function(client)
      -- Format on save
      if client.resolved_capabilities.document_formatting then
        vim.cmd([[
        augroup Format
          au! * <buffer>
          au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
      ]])
      end
    end,
    cmd = { "efm-langserver", "-logfile", "/tmp/efm.log", "-loglevel", "5" },
    root_dir = function(fname)
      local cwd = lsp.util.root_pattern("tsconfig.json")(fname)
        or lsp.util.root_pattern(".eslintrc.json", ".git")(fname)
        or lsp.util.root_pattern("package.json", ".git/", ".zshrc")(fname)

      return cwd
    end,
    filetypes = vim.tbl_keys(languages),
    init_options = { documentFormatting = true },
    settings = {
      rootMarkers = { "package.json", ".git", "tsconfig.json" },
      lintDebounce = 500,
      languages = languages,
    },
  }
end
