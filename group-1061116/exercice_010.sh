TEMP=$(date)

touch tempfile$TEMP.txt

echo "Permissions initiales de 'tempfile$TEMP.txt' :"
ls -l tempfile$TEMP.txt
echo "Permissions modifiées de 'tempfile$TEMP.txt' :"
chmod 600 tempfile$TEMP.txt
chown root:root tempfile$TEMP.txt
ls -l tempfile_$TEMP.txt
