vim.g.onedark_terminal_italics = 1
vim.cmd('colorscheme onedark')
vim.cmd('set termguicolors')
vim.g.lightline = {
  colorscheme = 'onedark'
}
vim.cmd("set signcolumn=yes:1")                 -- Enable sign column
vim.cmd("set number relativenumber")            -- Hybrid lines
-- vim.api.nvim_set_option('number', true)         -- Show current line
-- vim.api.nvim_set_option('relativenumber', true) -- Enable relative lines
