PAQUET="curl"
RESULTAT=$(dpkg -l | grep -w "$PAQUET")

if [ -n "$RESULTAT" ]; then
echo "Le paquet '$PAQUET' est installé."
else
echo "Le paquet '$PAQUET' n'est pas installé."
fi
