#eval "$(starship init zsh)"

export EDITOR=nvim
export VISUAL=nvim

#bindkey '^B' backward-word    # Ctrl + B перемещает на одно слово назад
#bindkey '^F' forward-word     # Ctrl + F перемещает на одно слово вперед
#bindkey '^[b' backward-char   # Alt + B перемещает на один символ назад
#bindkey '^[f' forward-char    # Alt + F перемещает на один символ вперед

# Восстановление привязок для истории
#bindkey '^P' up-history       # Ctrl+P - предыдущая команда
#bindkey '^N' down-history     # Ctrl+N - следующая команда

# Включение vim mode in zsh
#bindkey -v


# Путь к плагинам
source ~/.zSsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Настройки для автодополнений
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'



# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~
autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select



#plugins=(
 # git
 # 1password
 # ansible
 ## archlinux
#  argocd
##  aws
#  docker
#  docker-compose
 # helm
 # kubectl
#  opentofu
#  terraform
#  themes
 # tmux-cssh
#)

alias v='nvim'
