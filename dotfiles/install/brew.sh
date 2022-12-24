# Install Homebrew
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew update
# brew upgrade

# Install packages
apps=(
  age
  argocd
  # azure-cli
  bat
  btop
  coreutils
  exa
  fd
  gcc
  git
  gnupg
  go
  helm
  jq
  derailed/k9s/k9s
  kubernetes-cli
  kubie
  jesseduffield/lazygit/lazygit
  minikube
  navi
  neovim
  node
  openvpn
  pdm
  pipx
  romkatv/powerlevel10k/powerlevel10k
  pyenv
  shellcheck
  sops
  strongswan
  terraform
  hashicorp/tap/terraform-ls
  trash-cli
  tree-sitter
  wget
  xclip
  yarn
  yq
  zoxide
  zplug
  zsh-syntax-highlighting
  lua
  ripgrep
)

brew install "${apps[@]}"

# Git comes with diff-highlight, but isn't in the PATH
ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" /usr/local/bin/diff-highlight
