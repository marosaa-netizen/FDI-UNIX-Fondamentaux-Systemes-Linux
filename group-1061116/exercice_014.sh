#!/bin/bash

USER="testuser"

GROUP="etna"

if [ "$(id -u)" -ne 0 ]; then
    echo "Ce script doit être exécuté en root."
    exit 1
fi

if ! getent group "$GROUP" >/dev/null; then
    groupadd "$GROUP"
    echo "Groupe $GROUP créé."
fi

if id "$USER" &>/dev/null; then
    echo "L'utilisateur $USER existe déjà."
else
    adduser --disabled-password --gecos "" "$USER"
    echo "Utilisateur $USER créé."
fi

usermod -g "$GROUP" "$USER"

if id "$USER" &>/dev/null; then
    echo "Informations de l'utilisateur $USER :"
    id "$USER"
else
    echo "Erreur : l'utilisateur $USER n'existe pas."
fi
