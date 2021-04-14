-- sudo pacman -S haskell-languague-server

require('lspconfig').hls.setup{
  on_attach = require('lsp').common_on_attach,
}
