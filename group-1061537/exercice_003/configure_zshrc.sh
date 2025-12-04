LOG="exercice_003/configure_zshrc.log"
ZSHRC="$HOME/.zshrc"

if [ ! -f "$ZSHRC" ]; then
  echo "Le fichier $ZSHRC n'existe pas." | tee "$LOG"
fi

if ! grep -q "git" "$ZSHRC"; then
  echo "Ajout du plugin git..." | tee -a "$LOG"
  sed -i '/^plugins=/ s/(/(git /' "$ZSHRC"
else
  echo "Le plugin git est déjà configuré." | tee -a "$LOG"
fi

if ! grep -q "zsh-completions" "$ZSHRC"; then
  echo "Ajout du plugin zsh-completions..." | tee -a "$LOG"
  sed -i '/^plugins=/ s/(/(git /' "$ZSHRC"
else
  echo "Le plugin zsh-completions est déjà configuré." | tee -a "$LOG"
fi

if ! grep -q "compinit" "$ZSHRC"; then
  echo "Activation de compinit..." | tee -a "$LOG"
  echo "autoload -Uz compinit && compinit" >> "$ZSHRC"
else
  echo "compinit est déjà activé." | tee -a "$LOG"
fi

echo "Configuration terminée." | tee -a "$LOG"
