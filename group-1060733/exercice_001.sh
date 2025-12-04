mkdir exercice_001 && touch exercice_001/date.txt && date| sed "s/^/Date: /" | tee exercice_001/date.txt
