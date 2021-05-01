--Add leader shortcuts
nnoremap('<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])
nnoremap('<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]])
nnoremap('<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]])
nnoremap('<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]])
nnoremap('<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]])
nnoremap('<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
nnoremap('<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]])
nnoremap('<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]])
nnoremap('<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]])
nnoremap('<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]])
nnoremap('<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]])

