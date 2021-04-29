{ pkgs, buildKakounePluginFrom2Nix, ... }:
{
  home.file.".config/kak-lsp/kak-lsp.toml".source = ./kak-lsp.toml;
  home.file.".config/kak/colors/onedark.kak".source = ./onedark.kak;

  programs.kakoune = {
    enable = true;
    config = {
      colorScheme = "onedark";
      indentWidth = 2;
      numberLines = {
        enable = true;
        relative = true;
        highlightCursor = true;
      };
      scrollOff = {
        lines = 20;
      };
      keyMappings = [
        {
          docstring = "LSP Mode";
          key       = "l";
          mode      = "user";
          effect    = ": enter-user-mode lsp<ret>";
        }
        {
          docstring = "FZF Mode";
          key       = "<c-p>";
          mode      = "normal";
          effect    = ": fzf-mode<ret>";
        }
      ];
      hooks = [
        {
          name = "WinSetOption";
          option = "filetype=(rust|go)";
          commands = 
            ''
            lsp-enable-window

            hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
            hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
            hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
            hook -once -always window WinSetOption filetype=.* %{
              remove-hooks window semantic-tokens
            }
            '';
        }
        {
          name = "WinSetOption";
          option = "filetype=rust";
          commands = 
            ''
            hook window -group rust-inlay-hints BufReload .* rust-analyzer-inlay-hints
            hook window -group rust-inlay-hints NormalIdle .* rust-analyzer-inlay-hints
            hook window -group rust-inlay-hints InsertIdle .* rust-analyzer-inlay-hints
            hook -once -always window WinSetOption filetype=.* %{
              remove-hooks window rust-inlay-hints
            }
            '';
        }
      ];
    };
    plugins = with pkgs.kakounePlugins; [
      tabs-kak
      kak-fzf
      kak-auto-pairs
      buildKakounePluginFrom2Nix {
        pname = "fzf-kak";
        version = "2021-04-03";
        src = fetchFromGitHub {
          owner = "andreyorst";
          repo = "fzf.kak";
          rev = "1b3a3beebbe7134e671fde2ef2f4242b34ae2c60";
          sha256 = "0rsd65zcizbq3isy8576gqw7mcml5ixw84padaz6ndwfif5fv701";
        };
        meta.homepage = "https://github.com/andreyorst/fzf.kak/";
      }
    ];
    extraConfig = 
      ''
      eval %sh{kak-lsp --kakoune -s $kak_session}  # Not needed if you load it with plug.kak.
      '';
  };
  home.packages = with pkgs; [
    kak-lsp  # LSP for kakoune
  ];
}
