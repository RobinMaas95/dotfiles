# Install cask packages
apps=(
  alfred
  authy
  azure-data-studio
  bitwarden
  docker
  font-hack-nerd-font
  gimp
  karabiner-elements
  kitty
  microsoft-azure-storage-explorer
  notion
  openvpn-connect
  postman
  secretive
  visual-studio-code
)

brew install "${apps[@]}" --cask
