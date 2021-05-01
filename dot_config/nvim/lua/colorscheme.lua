-- Cool floating window popup menu for completion on command line

local opt = vim.opt
opt.pumblend = 17
opt.termguicolors                 = true
vim.g.sonokai_transparent_background = true
vim.g.enable_italic                  = true
-- vim.g.material_style              = ""
-- vim.g.material_italic_comments    = true
-- vim.g.material_italic_keywords    = true
-- vim.g.material_italic_functions   = true
-- vim.g.material_italic_variables   = true
-- vim.g.material_disable_background = true

vim.o.background = "dark"

  -- highlight Normal guibg=none
  -- highlight NonText guibg=none
vim.cmd([[
  colorscheme sonokai
]])
