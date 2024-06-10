local lsp = require("lspconfig")
-- npm install -g @prisma/language-server

return function(on_attach)
  return {
    on_attach = on_attach,
    cmd = { "prisma-language-server", "--stdio" },
    filetypes = { "prisma" },
    root_dir = lsp.util.root_pattern(".git", "package.json"),
    settings = {
      prisma = {
        prismaFmtBinPath = "",
      },
    },
  }
end
