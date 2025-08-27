if type -q eza
    alias ll "eza -G --icons"
end

eval (/opt/homebrew/bin/brew shellenv)

function fish_greeting
    fish_logo fff 3f9afc 7e42ff
end

alias vim="nvim"

fish_add_path /Users/williamdavidson/.spicetify
