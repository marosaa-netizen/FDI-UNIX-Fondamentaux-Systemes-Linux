apt-get -qq update -y
apt-get -qq install -y "$PAQUET">/dev/null 2>&1
PAQUET="vim"
RESULTAT=$(dpkg -l | grep -w "$PAQUET")

if [ -n "$RESULTAT" ]; then
echo "Le paquet '$PAQUET' est installé."
else
echo "Le paquet '$PAQUET' n'est pas installé."
fi
