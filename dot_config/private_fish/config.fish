#!/bin/fish

alias ls="lsd"
alias sudo="doas"

fish_vi_key_bindings

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end

# Git aliases
alias gst='git status'
alias gaa='git add --all'
alias ga='git add'
alias gah='git add .'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'

