#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Erreur: ce script nécessite exactement un argument."
    exit 1
fi

option="$1"

result=$(man ls | grep -A 1 -E "^\s*$option")

if [ -n "$result" ]; then
    echo "Section des options trouvée :"
    echo "$result"
else
    echo "Section des options non trouvée."
fi
