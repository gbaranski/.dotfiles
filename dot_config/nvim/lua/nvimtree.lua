nnoremap('<C-t>'    , ':NvimTreeToggle<CR>'  )
nnoremap('<leader>r', ':NvimTreeRefresh<CR>' )
nnoremap('<leader>n', ':NvimTreeFindFile<CR>')

vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
}
