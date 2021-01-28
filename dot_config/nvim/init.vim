call plug#begin()
" LSP
Plug 'neovim/nvim-lspconfig'

" MISC
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'christoomey/vim-tmux-navigator' " integration with tmux
Plug 'nvim-lua/completion-nvim' " Add auto competion
Plug 'tpope/vim-surround' " parentheses, brackets, quotes, XML tags
Plug 'tpope/vim-commentary' " add comments using gcc command 
Plug 'wakatime/vim-wakatime'

" APPEARENCE
Plug 'joshdick/onedark.vim'

call plug#end()

lua << EOF
lspconfig = require "lspconfig"
completion = require "completion"

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  on_attach = completion.on_attach
}
function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local method = "textDocument/codeAction"
  local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
  if resp and resp[1] then
    local result = resp[1].result
    if result and result[1] then
      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end

  vim.lsp.buf.formatting()
end
EOF

" LSP Config
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Hide netrw banner
let g:netrw_banner = 0

" set completeopt-=preview
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufWritePre *.go lua goimports(1000)

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" set theme
syntax enable
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
" set termguicolors
colorscheme onedark

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" Fix to use system clipboard
set clipboard=unnamedplus

set number relativenumber
set nu rnu
set noswapfile
set autoindent
set tabstop=2 shiftwidth=2 expandtab

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
