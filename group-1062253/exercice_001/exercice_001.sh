#!/bin/bash

set -e

echo "Mise à jour des paquets"
sudo apt update -y && sudo apt upgrade -y

echo "Installation de Git"
if sudo apt install -y git; then
    echo "Installation de Git : OK"
else
    echo "Erreur lors de l'installation de Git"
    exit 1
fi

echo "Installation de Zsh"
if sudo apt install -y zsh; then
    echo "Installation de Zsh : OK"
else
    echo "Erreur lors de l'installation de Zsh"
    exit 1
fi

ZSH_PATH=$(command -v zsh)
if [ -z "$ZSH_PATH" ]; then
    echo "Chemin de Zsh introuvable"
    exit 1
fi
echo "Chemin de Zsh : $ZSH_PATH"

if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo "Changement du shell par défaut vers Zsh..."
    if chsh -s "$ZSH_PATH"; then
        echo "Shell modifié avec succès"
    else
        echo "Erreur lors du changement de shell"
        exit 1
    fi
else
    echo "Le shell est déjà Zsh"
fi

read -p "Nom Git : " git_name
read -p "Email Git : " git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"

echo "Configuration terminée. Redémarre ta session."

