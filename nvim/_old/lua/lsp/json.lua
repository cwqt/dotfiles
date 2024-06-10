local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return function(on_attach)
  return {
    on_attach = function(client, bufnr)
      -- efm formats for us
      client.resolved_capabilities.document_formatting = false
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  }
end
