# vim: set ft=fish:
#!/bin/fish

fish_add_path ~/.cargo/bin

function fish_mode_prompt
    # NOOP - Disable vim mode indicator
end

function fish_user_key_bindings
  fish_vi_key_bindings
end

alias gst="git status"
alias ga="git add"
alias gaa="git add --all"
alias gah="git add ."
alias gp="git push"
alias gc="git commit -v"
alias nano="echo 'fish: did you mean vim?'"
alias ls="exa --icons"

alias tpl="trans en:pl"
alias ten="trans pl:en"

zoxide init fish | source
# starship init fish | source
