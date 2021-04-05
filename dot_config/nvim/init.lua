vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

--
-- File navigation
--
paq 'preservim/nerdtree'           -- File manager
paq 'junegunn/fzf'                 -- Fuzzy finder, that requires `fzf` and `bat` installed
paq 'junegunn/fzf.vim'             -- Also fuzzy finder, no idea why two packages

vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { silent = true })   -- Open/close file navigation buf

vim.api.nvim_set_keymap('n', '<C-f>', ':Files<CR>', { silent = true })  -- Open fzf using C-f
-----------------------------------------------

--
-- Apperance
--
paq 'morhetz/gruvbox'        -- Theme
paq 'itchyny/lightline.vim'  -- Light statusline


gruvbox_italic = 1
gruvbox_italicize_strings = 1
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_strings = 1

-----------------------------------------------


--
-- Misc
--
paq 'tpope/vim-commentary'            -- Comments using `gcc` command
paq 'tpope/vim-surround'              -- Parenthees, brackets, XML tags and etc

paq 'christoomey/vim-tmux-navigator'  -- Tmux C-hjkl navigation

vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { })  -- Disable arrow Up in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { }) -- Disable arrow Up in Insert

vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { })  -- Disable arrow Down in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { }) -- Disable arrow Down in Insert

vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { })  -- Disable arrow Left in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { }) -- Disable arrow Left in Insert

vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { })  -- Disable arrow Right in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { }) -- Disable arrow Right in Insert

vim.cmd("set signcolumn=yes:1")        -- Enable sign column
vim.cmd("set clipboard+=unnamedplus")  -- Enable system clipboard
vim.cmd("set number relativenumber")   -- Show relative line

vim.cmd("set noswapfile")              -- Disable swap files
vim.cmd("set nobackup")                -- Disables backups
vim.cmd("set nowritebackup")           -- Disables write backups

vim.cmd("set autoindent")              -- Enable automatic indentatation
vim.cmd("set tabstop=2")               -- Set tab to 2 spaces
vim.cmd("set softtabstop=2")           -- Set softtabstop to 2 spaces
vim.cmd("set shiftwidth=2")            -- After pressing << or >> it will move by 2
vim.cmd("set expandtab")               -- <TAB> inserts `softtabstop` amount of characters

-- vim.cmd("set updatetime=300")          -- Change updatetime

-- 
-- LSP
--
paq 'neovim/nvim-lspconfig'           -- Neovim official LSP
paq 'hrsh7th/nvim-compe'              -- Neovim auto completion
paq 'nvim-treesitter/nvim-treesitter' -- Nice syntax highlighting

local lspconfig = require 'lspconfig'
local treesitter = require 'nvim-treesitter.configs'
local compe = require 'compe'

-- Setup treesitter
treesitter.setup {
  ensure_installed = "all",     
  highlight = {
    enable = true              
  },
}


-- Setup auto suggestions
vim.o.completeopt = "menuone,noselect"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

compe.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    treesitter = true;
  };
}

local on_attach = function(client, buffer)
  -- Map functions
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Define options for all keymaps
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

local servers = { "rust_analyzer", "gopls" }

for _, lsp_name in ipairs(servers) do
  lspconfig[lsp_name].setup {
    on_attach = on_attach,
  }
end

