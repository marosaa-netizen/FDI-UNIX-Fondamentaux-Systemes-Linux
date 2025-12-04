#!/bin/bash

set -e

echo "Mise à jour des paquets"
sudo apt update -y && sudo apt upgrade -y

echo "Installation des outils essentiels"
sudo apt install -y git vim curl wget zsh openssh-client

echo "Installation d'Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
fi

ZSH_PATH=$(command -v zsh)
if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo "Changement du shell par défaut vers Zsh"
    chsh -s "$ZSH_PATH"
fi

echo "Ajout d'alias et prompt personnalisé"
echo "alias ll='ls -al'" >> ~/.zshrc
echo "alias gs='git status'" >> ~/.zshrc
echo "export PS1='%F{green}%n@%m %F{blue}%~ %# %f'" >> ~/.zshrc

read -p "Nom Git : " git_name
read -p "Email Git : " git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"

echo "Environnement reconstruit avec succès ! Redémarrez votre session."
