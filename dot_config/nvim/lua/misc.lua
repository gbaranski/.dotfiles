vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { })  -- Disable arrow Up in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { }) -- Disable arrow Up in Insert

vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { })  -- Disable arrow Down in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { }) -- Disable arrow Down in Insert

vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { })  -- Disable arrow Left in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { }) -- Disable arrow Left in Insert

vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { })  -- Disable arrow Right in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { }) -- Disable arrow Right in Insert

vim.api.nvim_set_keymap('', '<A-i>', '<C-a>', { noremap = true }) -- Increment using Alt + I
vim.api.nvim_set_keymap('', '<A-d>', '<C-x>', { noremap = true }) -- Decrement using Alt + D

vim.cmd("set clipboard+=unnamedplus")  -- Enable system clipboard

vim.cmd("set noswapfile")              -- Disable swap files
vim.cmd("set nobackup")                -- Disables backups
vim.cmd("set nowritebackup")           -- Disables write backups

vim.cmd("set autoindent")              -- Enable automatic indentatation
vim.cmd("set tabstop=2")               -- Set tab to 2 spaces
vim.cmd("set softtabstop=2")           -- Set softtabstop to 2 spaces
vim.cmd("set shiftwidth=2")            -- After pressing << or >> it will move by 2
vim.cmd("set expandtab")               -- <TAB> inserts `softtabstop` amount of characters
vim.cmd("set hidden")                  -- Hides buffer

-- vim.cmd("set updatetime=300")          -- Change updatetime
