-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Auto pairs
  -- use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  -- gcc to comment line
  use {
    'terrortylor/nvim-comment',
    config = [[ require('nvim_comment').setup() ]],
  }
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
      nnoremap('t', '<cmd>lua require("hop").hint_words()<CR>')
    end
  }

  use {
    'npxbr/glow.nvim',
    config = function() nnoremap('<leader>p', '<cmd>Glow<CR>') end
  }

  -- Requries https://github.com/jabirali/tmux-tilish installed
  use {
    'numToStr/Navigator.nvim',
    config = function()
      require('Navigator').setup()
      nnoremap('<A-h>', '<cmd>lua require("Navigator").left()<CR>')
      nnoremap('<A-j>', '<cmd>lua require("Navigator").down()<CR>')
      nnoremap('<A-k>', '<cmd>lua require("Navigator").up()<CR>')
      nnoremap('<A-l>', '<cmd>lua require("Navigator").right()<CR>')
      -- nnoremap('<A-p>', '<cmd>lua require("Navigator").previous()<CR>')
    end
  }


  -- Appearance
  use {
    'sainnhe/sonokai',
    config = function() require('colorscheme') end,
  }

  -- Project/Files navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim', 
      'nvim-lua/plenary.nvim'
    },
    config = function() require('telescope') end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('nvimtree') end
  }
  -- use {
  --   'akinsho/nvim-bufferline.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require('tabs')
  --   end
  -- }


  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('treesitter') end

  }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'statusline' end,
    requires = { 'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim' }

  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = { 
      'nvim-lua/completion-nvim', 
      'nvim-lua/lsp_extensions.nvim', 
      'norcalli/snippets.nvim', 
      'glepnir/lspsaga.nvim', 
      'nvim-lua/lsp-status.nvim',
      'akinsho/flutter-tools.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function() require('lsp') end
  }
end)
