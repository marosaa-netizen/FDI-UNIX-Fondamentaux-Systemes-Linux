Output_file="config_reseau.txt"
Interfaces_cmd="ip addr"
Routes_cmd="ip route"

echo "Interfaces :" > "$Output_file"
$Interfaces_cmd >> "$Output_file"

echo -e "\nRoutage :" >> "$Output_file"
$Routes_cmd >> "$Output_file"

echo "Configuration réseau enregistrée dans $Output_file."
