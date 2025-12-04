UPDATE_CMD="sudo apt update -y >/dev/null 2>&1"
UPGRADABLE_CMD="apt list --upgradable 2>/dev/null"
echo "Mise à jour de la liste des paquets..."
eval "$UPDATE_CMD"
UPGRADABLE=$(eval "$UPGRADABLE_CMD" | grep -v "Listing..." )
if [ -n "$UPGRADABLE" ]; then
    echo "Les paquets suivants peuvent être mis à jour :"
    echo "$UPGRADABLE"
else
    echo "Tous les paquets sont déjà à jour."
fi
