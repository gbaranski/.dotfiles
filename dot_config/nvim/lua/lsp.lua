local opt = vim.opt
local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local completion = require('completion')
local saga = require('lspsaga')

lsp_status.register_progress()

opt.completeopt = 'menuone,noinsert,noselect'
vim.cmd([[ set shortmess+=c ]])

vim.g.completion_enable_snippet = 'snippets.nvim'
vim.g.completion_matching_smart_case = 1

vim.api.nvim_set_keymap('i', '<Tab>'  , 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })

local on_attach = function(client, bufnr)
  completion.on_attach()
  saga.init_lsp_saga {
    code_action_prompt = {
      enable = false,
    }

  }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function buf_nnoremap(key, cmd) vim.api.nvim_buf_set_keymap(bufnr, 'n', key, cmd, { noremap = true, silent = true }) end
  local function buf_vnoremap(key, cmd) vim.api.nvim_buf_set_keymap(bufnr, 'v', key, cmd, { noremap = true, silent = true }) end

  -- Mappings.
  buf_nnoremap('gD'        , '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_nnoremap('gd'        , '<Cmd>lua vim.lsp.buf.definition()<CR>')
  buf_nnoremap('gh'        , '<Cmd>lua require("lspsaga.provider").lsp_finder()<CR>')
  buf_nnoremap('gt'        , '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf_nnoremap('gr'        , '<cmd>lua vim.lsp.buf.references()<CR>')
  buf_nnoremap('K'         , '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
  buf_nnoremap('gi'        , '<cmd>lua vim.lsp.buf.implementation()<CR>')
  buf_nnoremap('<C-k>'     , '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf_nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  buf_nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  buf_nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  buf_nnoremap('<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>')
  buf_nnoremap('<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
  buf_vnoremap('<leader>ca', ':<C-u>lua require("lspsaga.codeaction").range_code_action()<CR>')
  buf_nnoremap('<leader>e' , '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>')
  buf_nnoremap('[e'        , '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
  buf_nnoremap(']e'        , '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')
  buf_nnoremap('<leader>q' , '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')


  buf_nnoremap('<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
  buf_nnoremap('<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')

  if vim.bo.filetype == "rust" then
    vim.api.nvim_exec([[
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{ enabled = { "ChainingHint", "TypeHint", "ParameterHint"}, prefix = "  "}    
    ]], false)
  end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_nnoremap('<leader>ft', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_vnoremap('<leader>ft', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
  end
end


require("flutter-tools").setup{
  flutter_path = "/usr/bin/flutter",
  lsp = {
    on_attach = on_attach,
  },
}

nvim_lsp.ccls.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("platformio.ini") or dirname,
  init_options = {
    compilationDatabaseDirectory = ".pio",
  }
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
}
