-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

-- Onedark theme
vim.o.termguicolors = true;
vim.g.onedark_terminal_italics = 1;
vim.g.lightline = {
  colorscheme = 'onedark'
}

vim.cmd([[
colorscheme onedark
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none | highlight NonText ctermbg=none guibg=none
]])
