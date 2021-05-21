# vim: set ft=fish:
#!/bin/fish

set -U fish_color_normal normal
set -U fish_color_command 99cc99
set -U fish_color_quote ffcc66
set -U fish_color_redirection d3d0c8
set -U fish_color_end cc99cc
set -U fish_color_error f2777a
set -U fish_color_param d3d0c8
set -U fish_color_comment ffcc66
set -U fish_color_match 6699cc
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 6699cc
set -U fish_color_escape 66cccc
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 747369
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

fish_add_path /opt/android-sdk/tools/bin

function fish_mode_prompt
    # NOOP - Disable vim mode indicator
end

function fish_user_key_bindings
  fish_vi_key_bindings
end


# export GPG_TTY=(tty)

alias sudo="doas"
alias gst="git status"
alias ga="git add"
alias gaa="git add --all"
alias gah="git add ."
alias gp="git push"
alias gc="git commit -v"
alias nano="echo 'fish: did you mean vim?'"
alias ls="lsd"
# alias gd="batdiff"
# alias man="batman"
# alias grep="batgrep"

alias tpl="trans en:pl"
alias ten="trans pl:en"

zoxide init fish | source
# starship init fish | source
