
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git aws)

source $ZSH/oh-my-zsh.sh


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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Настройки для автодополнений
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'



# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~
autoload -Uz compinit
compinit -u
complete -C "$(which aws_completer)" aws

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
alias k='kubectl'

export DEFAULT_USER="daboogie"


prompt_dir() {
  prompt_segment blue black "%2~"
}

export AWS_PAGER=""
export AWS_PAGER=""




alias kdebugnode='function _kdebugnode() { \
  ns="$1"; pod="$2"; \
  if [ -z "$ns" ] || [ -z "$pod" ]; then \
    echo "Usage: kdebugnode <namespace> <pod-name>"; return 1; \
  fi; \
  node=$(kubectl get pod "$pod" -n "$ns" -o jsonpath="{.spec.nodeName}"); \
  kubectl run debug-netshoot --rm -i -t \
    --restart=Never \
    --image=nicolaka/netshoot \
    --overrides="{ \
      \"apiVersion\": \"v1\", \
      \"spec\": { \
        \"nodeName\": \"${node}\", \
        \"tolerations\": [{ \
          \"key\": \"node.kubernetes.io/not-ready\", \
          \"operator\": \"Exists\", \
          \"effect\": \"NoExecute\" \
        }] \
      } \
    }" \
    -n "$ns" \
    -- bash; \
}; _kdebugnode'



convert_utc_to_chicago() {
  while read -r line; do
    echo "$line" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(\.[0-9]+)?Z' | while read -r ts; do
      local converted=$(date -d "$ts" '+%Y-%m-%d %H:%M:%S %Z')
      echo "$line" | sed "s|$ts|$converted|"
    done
  done
}


export TZ="America/Chicago"


# Created by `pipx` on 2025-05-12 21:45:38
export PATH="$PATH:/home/daboogie/.local/bin"
