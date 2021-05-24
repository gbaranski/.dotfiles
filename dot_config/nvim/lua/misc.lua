local opt = vim.opt

opt.guifont = [[Fira\ Code\ Nerd\ Font:12]]

nnoremap('<space><space>', '<C-^>') -- spc-spc to change switch between last buffers

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true})

local nvim_tree = require('nvim-tree.view')
local fmwinopts = nvim_tree.View.winopts
local fmbufopts = nvim_tree.View.bufopts

-- Most of these opts come from https://github.com/tjdevries/config_manager

fmwinopts.relativenumber = true -- Show line numbers relatively to current line on file manager
fmwinopts.number         = true -- Show current line

vim.wo.relativenumber = true -- Show line numbers relatively to currrent line
vim.wo.signcolumn     = 'yes:1' -- Enable sign colum with width = 1
vim.wo.number         = true -- Show current line number
vim.wo.scrolloff    = 10   -- Make it so there are always ten lines below my cursor
vim.bo.swapfile     = false -- Disable swap files
vim.bo.tabstop = 4 -- tabs are at proper location
vim.bo.shiftwidth = 4 -- indenting is 2 spaces
vim.bo.expandtab = true -- don't use actual tab character (ctrl-v)
vim.bo.smartindent = true -- Smart auto indenting when starting a new line
vim.bo.cindent = true-- Enables automatic C program indenting
vim.bo.formatoptions = 'tcqjn'
vim.o.hidden          = true  -- Instead of closing hide buffers

vim.o.inccommand      = 'split' -- Nice popup when replacing
vim.o.clipboard       = "unnamedplus" -- System clipboard
vim.o.ignorecase      = true  -- Ignore case when searching...
vim.o.smartcase       = true  -- ...unless there is capital case
vim.o.splitright      = true  -- Prefer splitting to the right
vim.o.splitbelow      = true  -- Prefer splitting to the bottom

vim.o.incsearch       = true  -- Makes search act like search in modern browsers
vim.o.showmode        = false -- Don't show current mode, I've got statusline for that
vim.o.hidden          = true  -- Instead of closing hide buffers
vim.o.writebackup     = false -- Disable write backups
