LOG="exercice_002/setup_ohmyzsh.log"
DIR="$HOME/.oh-my-zsh"

log() {
    echo "$1" | tee -a "$LOG"
}

log "Début du script"

if [ -d "$DIR" ]; then
    log "Zsh est déjà installé"
else
    log "Zsh n'est pas installé, installation en cours..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended >> "$LOG" 2>&1

    if [ -d "$DIR" ]; then
        log "Zsh installé avec succès"
    else
        log "Erreur lors de l'installation de Zsh"
        exit 1
    fi
fi

log "Fin du script"
