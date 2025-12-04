LOG="exercice_001/setup_zsh.log"

log() {
    echo "$1" | tee -a "$LOG"
}

log "Début du script"

if command -v zsh >/dev/null 2>&1; then
    log "Zsh est déjà installé"
else
    log "Zsh n'est pas installé, installation en cours..."
    sudo apt update -y >> "$LOG" 2>&1
    sudo apt install -y zsh >> "$LOG" 2>&1

    if command -v zsh >/dev/null 2>&1; then
        log "Zsh installé avec succès"
    else
        log "Erreur lors de l'installation de Zsh"
        exit 1
    fi
fi

log "Changement du shell par défaut en Zsh" >> "$LOG"
chsh -s "$(command -v zsh)"

log "Fin du script"
