-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
  -- Packer can manage itself use 'wbthomason/packer.nvim'
  use 'wbthomason/packer.nvim'

  -- Navigation
  use 'preservim/nerdtree' -- File manager
  use 'junegunn/fzf'       -- Fuzzy finder, that requires `fzf` and `bat` installed
  use 'junegunn/fzf.vim'   -- Also fuzzy finder, no idea why two packages
  use {                    -- Bufferline
    'romgrk/barbar.nvim', 
    requires = 'kyazdani42/nvim-web-devicons'
  } 

  -- Appearance
  use 'joshdick/onedark.vim'         -- Theme
  use 'itchyny/lightline.vim'        -- Light statusline

  use {                              -- Git signs
    'lewis6991/gitsigns.nvim', 
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      -- Setup highlights before calling setup()
      vim.cmd[[ highlight GitSignsAdd    guifg=#98C379 ]]
      vim.cmd[[ highlight GitSignsChange guifg=#E5C07B ]]
      vim.cmd[[ highlight GitSignsDelete guifg=#E06C75 ]]
      require('gitsigns').setup()
    end
  }

  use 'tpope/vim-commentary'            -- Comments using `gcc` command
  use 'tpope/vim-surround'              -- Parenthees, brackets, XML tags and etc
  use 'jiangmiao/auto-pairs'            -- Automatic pairs

  use 'christoomey/vim-tmux-navigator'  -- Tmux C-hjkl navigation

  use 'neovim/nvim-lspconfig'           -- Neovim official LSP
  use 'hrsh7th/nvim-compe'              -- Neovim auto completion
  use 'nvim-treesitter/nvim-treesitter' -- Nice syntax highlighting

end)
