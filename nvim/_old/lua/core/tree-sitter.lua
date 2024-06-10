local M = {}

M.setup = function()
  -- Auto-close HTML tags
  require("nvim-ts-autotag").setup()

  -- Setup tree-sitter
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = false,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    ensure_installed = {
      "tsx",
      "toml",
      "fish",
      "bash",
      "json",
      "yaml",
      "html",
      "css",
      "scss",
      "markdown",
    },
  })

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

  -- Top indent code outline
  require("treesitter-context").setup({})
end

return M
