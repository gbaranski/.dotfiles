{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = 
      "lua << EOF\n" + 
        builtins.readFile ./lua/opt.lua +  
        builtins.readFile ./lua/appearance.lua +  
        builtins.readFile ./lua/syntax-highlighting.lua +  
        builtins.readFile ./lua/navigation.lua +  
        builtins.readFile ./lua/misc.lua +  
        builtins.readFile ./lua/lsp.lua + 
      "\nEOF";
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      completion-nvim
      lsp_extensions-nvim 
      nvim-web-devicons 
      onedark-vim 
      lightline-vim 
      nvim-treesitter 
      telescope-nvim 
      popup-nvim 
      plenary-nvim
      nvim-tree-lua
      vim-surround
      barbar-nvim
      vim-commentary
      auto-pairs
    ];
  };
}
