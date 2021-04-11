vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')      -- Go definitons
vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')     -- Go declaration
vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')      -- Go references
vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')  -- Go implementations
vim.cmd('nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>') -- Go type definition
vim.cmd('nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>')     -- Show code actions
vim.cmd('nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>')            -- Show docs
vim.cmd('nnoremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>') -- Format

vim.cmd('nnoremap <silent> <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>') -- Add workspace folder
vim.cmd('nnoremap <silent> <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')  -- Remove workspace folder
vim.cmd('nnoremap <silent> <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>') -- List workspace folders

vim.cmd('nnoremap <silent> <space>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>') -- Show lien diagnostics

vim.cmd('nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>') -- Previous error
vim.cmd('nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>') -- Next error
