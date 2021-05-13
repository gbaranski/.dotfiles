local opt = vim.opt

opt.guifont = [[Fira\ Code\ Nerd\ Font:12]]

nnoremap('<space><space>', '<C-^>') -- spc-spc to change switch between last buffers

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true})

function _G.init_bufopts()
  opt.signcolumn      = 'yes:1'
  opt.clipboard       = "unnamedplus" -- System clipboard
  opt.incsearch       = true  -- Makes search act like search in modern browsers
  opt.showmatch       = false -- Show matching parenthees
  opt.relativenumber  = true  -- Show line numbers relatively to currrent line
  opt.number          = true  -- Show current line number
  opt.ignorecase      = true  -- Ignore case when searching...
  opt.smartcase       = true  -- ...unless there is capital case
  opt.hidden          = true  -- Instead of closing hide buffers
  opt.cursorline      = false -- Highlight current line
  opt.splitright      = true  -- Prefer splitting to the right
  opt.splitbelow      = true  -- Prefer splitting to the bottom
  opt.hlsearch        = true  -- Highlight searches
  opt.scrolloff       = 10    -- Make it so there are always ten lines below my cursor
  opt.wrap            = true  -- Wrap lines
  opt.swapfile        = false -- Disable swap files
  opt.backup          = false -- Disable backups
  opt.writebackup     = false -- Disable write backups

  -- Indentation/Formatting
  opt.tabstop     = 2    -- tabs are at proper location
  opt.shiftwidth  = 2    -- indenting is 2 spaces
  opt.expandtab   = true -- don't use actual tab character (ctrl-v)
  opt.autoindent  = true -- Copies indent from current line when starting a new line
  opt.smartindent = true -- Smart auto indenting when starting a new line
  opt.cindent     = true -- Enables automatic C program indenting
  opt.breakindent = true -- Break indent

  opt.formatoptions = opt.formatoptions
                      + 'n' -- Recognize numbered lists
                      + 'j' -- When it makes sense, remove comment leader when joining lines
                      + 'c' -- Auto wrap comments inserting current comment leader
                      + 'r' -- Continue coments when using enter
                      - 'o' -- O and o don't continue comments
                      - 'a' -- Disable auto formatting
  
end


vim.cmd([[ autocmd FileType * :lua init_bufopts() ]])
init_bufopts()
