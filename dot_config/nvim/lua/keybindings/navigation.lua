vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { silent = true })   -- Open/close file navigation buf
vim.api.nvim_set_keymap('n', '<C-f>', ':Files<CR>', { silent = true })            -- Open fzf using C-f

vim.api.nvim_set_keymap('n', '<A-,>', ':BufferPrevious<CR>', { silent = true })      -- Open previous buffer
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferNext<CR>', { silent = true })          -- Open next buffer
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferMovePrevious<CR>', { silent = true })  -- Move previous buffer
vim.api.nvim_set_keymap('n', '<A->>', ':BufferMoveNext<CR>', { silent = true })      -- Move next buffer
vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', { silent = true })        -- Go to buffer 1
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', { silent = true })        -- Go to buffer 2
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', { silent = true })        -- Go to buffer 3
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', { silent = true })        -- Go to buffer 4
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', { silent = true })        -- Go to buffer 5
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', { silent = true })        -- Go to buffer 6
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', { silent = true })        -- Go to buffer 7
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', { silent = true })        -- Go to buffer 8
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferGoto 9<CR>', { silent = true })        -- Go to buffer 9

vim.api.nvim_set_keymap('n', '<C-c>', ':BufferClose<CR>', { silent = true }) -- Close current buffer
vim.api.nvim_set_keymap('n', '<C-s>', ':BufferPick<CR>', { silent = true })  -- Magically pick buffer

vim.api.nvim_set_keymap('n', '<Space>bd', ':BufferOrderByDirectory<CR>', { silent = true }) -- Order buffers by directory
vim.api.nvim_set_keymap('n', '<Space>bl', ':BufferOrderByLanguage<CR>', { silent = true })  -- Order buffers by languague
