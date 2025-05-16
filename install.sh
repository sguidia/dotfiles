#!/bin/bash
set -e



yay -S helm


helm completion zsh > ~/.helm-completion.zsh




clone_if_not_exists() {
    local repo_url=$1
    local target_dir=$2

    if [ -d "$target_dir" ]; then
        echo "Skipping: $target_dir already exists."
    else
        git clone "$repo_url" "$target_dir"
    fi
}

install_if_missing() {
    local packages_to_install=()

    for package in "$@"; do
        if ! pacman -Qi "$package" &>/dev/null; then
            packages_to_install+=("$package")
        else
            echo "Skipping: $package is already installed."
        fi
    done

    if [ ${#packages_to_install[@]} -gt 0 ]; then
        sudo pacman -S --noconfirm "${packages_to_install[@]}"
    fi
}

install_if_missing wget curl powerline-fonts git neovim

# Установка шрифтов
sudo cp -r ~/dotfiles/fonts /usr/share/fonts/
sudo fc-cache -fv

# Создаём папки заранее
mkdir -p ~/.zsh ~/.config/alacritty/



# ✅ Установка Oh My Zsh БЕЗ запуска zsh и без перезаписи .zshrc
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Skipping: Oh My Zsh is already installed."
fi

# Установка zsh-плагинов
clone_if_not_exists https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
clone_if_not_exists https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting


# ✅ Симлинки для остальных конфигов
rm ~/.zshrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.nvimrc ~/.nvimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml