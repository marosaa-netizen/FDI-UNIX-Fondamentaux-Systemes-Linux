URL=$1

echo "Informations DNS pour le domaine : $URL"
dig "$URL" +noall +answer
