-- npm install -g typescript typescript-language-server

function on_attach(client, buffer)
  require('lsp').common_on_attach(client, buffer)
  client.resolved_capabilities.document_formatting = false
end

require('lspconfig').tsserver.setup{
  on_attach = on_attach,
}
