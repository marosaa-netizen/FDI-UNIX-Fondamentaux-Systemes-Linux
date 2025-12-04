DIR="sortie/"
FILE_URL="$1"

echo "Création du répertoire \"$DIR\"."
mkdir -p "$DIR"
if [ $? -ne 0 ]; then
    echo "impossible de créer le répertoire."
fi
echo "Répertoire créé!"

echo "Téléchargement du fichier depuis $FILE_URL"
curl -L "$FILE_URL" -o "${DIR}téléchargement"
if [ $? -ne 0 ]; then
    echo "échec du téléchargement."
fi
echo "Fichier téléchargé !"
