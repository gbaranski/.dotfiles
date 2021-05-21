function fish_prompt
    printf '%s[%s%s%s@%s%s %s%s%s] %s' (set_color red --bold) \
    (set_color yellow --bold) $USER \
    (set_color green --bold) \
    (set_color blue --bold) $hostname \
    (set_color purple --bold) (prompt_pwd) \
    (set_color red --bold) \
    (set_color normal)
end                                     
