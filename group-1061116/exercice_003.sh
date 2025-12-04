if [ "$1" = "hello" ]; then
echo "Bonjour"
elif [ "$1" = "user" ]; then
whoami
elif [ "$1" = "machine" ]; then
hostname
else
echo "Argument invalide."
fi
