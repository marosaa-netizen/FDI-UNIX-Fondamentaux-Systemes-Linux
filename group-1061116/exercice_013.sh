#!/bin/bash

# Vérification du paramètre
if [ $# -ne 1 ]; then
    echo "Usage: $0 [SEUIL]"
    exit 1
fi

SEUIL=$1

# Récupération des processus dépassant le seuil CPU
PROC_LIST=$(ps aux --sort=-%cpu | awk -v seuil="$SEUIL" 'NR>1 && $3>seuil {print $0}')

if [ -z "$PROC_LIST" ]; then
    echo "Aucun processus ne correspond."
    exit 0
fi

# Affichage des processus
echo "Liste des processus consommant plus de $SEUIL% du CPU:"
echo "$PROC_LIST"

# Demande de PID à kill
read -p "Entrez un PID pour terminer le processus: " PID

# Vérification que le PID est bien dans la liste
if ! echo "$PROC_LIST" | awk '{print $2}' | grep -q "^$PID$"; then
    echo "Erreur : ce PID n'est pas dans la liste."
    exit 1
fi

# Envoi du signal de terminaison
echo "Envoi du signal de terminaison au processus $PID..."
kill "$PID"
