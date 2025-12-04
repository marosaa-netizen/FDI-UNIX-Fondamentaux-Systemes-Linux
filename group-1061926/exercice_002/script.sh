Target_dir="copie/"
Source_file="../exercice_001/sortie/téléchargement"
Status_file="${Target_dir}status"

if [ ! -d "$Target_dir" ]; then
    echo "Le répertoire \"$Target_dir\" n'existe pas."
    echo "Création du répertoire \"$Target_dir\""
    mkdir -p "$Target_dir"
fi

echo "Copie du fichier $Source_file dans $Target_dir"
cp "$Source_file" "$Target_dir"

echo "Calcul de la taille du téléchargement."
File_size=$(stat -c%s "$Target_dir/$(basename $Source_file)")

echo "Géneration du fichier de status."
if [ $File_size -gt 102400 ]; then
    echo "Fichier supérieur à 100 Ko" > "$Status_file"
else
    echo "Fichier inférieur ou égal à 100 ko" > "$Status_file"
fi
