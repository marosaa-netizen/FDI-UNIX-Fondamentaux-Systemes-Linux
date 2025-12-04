DIR="/var/log"
REPORT_DIR="exercice_012"
REPORT_FILE="$REPORT_DIR/disk_usage_report.txt"

mkdir -p "$REPORT_DIR"

du -sh "$DIR" 2>/dev/null > "$REPORT_FILE"

echo "Analyse du disque : $(cat $REPORT_FILE)"
