refresh_dotfiles() {
  local message=${1:-Refreshed dotfiles}

  cd ~/personal/dotfiles/
  
  rm -rf i3
  cp -r ~/.config/i3/ i3

  rm -rf nvim
  cp -r ~/.config/nvim/ nvim

  rm -rf zsh
  mkdir zsh
  cp ~/.zshrc zsh/.zshrc

  cd zsh
  cp -r $ZSH_CUSTOM custom

  cd ~/personal/dotfiles/
  git add .
  git commit -m "$message"
  git push origin main
}
