#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install GNU `tar`, overwriting the built-in `tar`.
brew install gnu-tar
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Add brew-installed bash to shells
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  #chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# BEGIN Additions by DFG
brew install ruby
brew install nvm
brew install telnet
brew install doggo
brew install ntpq
brew install ncdu
brew install gh
brew install git-flow
brew install tldr
brew install mysql-client
brew install swiftlint
brew cask install provisionql
brew install libressl
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
brew tap leoafarias/fvm
brew install fvm
brew install derailed/k9s/k9s
brew install kompose
brew install dotnet
brew install rust
brew install gitversion
brew install kubernetes-cli
brew install helm
brew install hudochenkov/sshpass/sshpass
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
# Setup python using pyevn see https://opensource.com/article/19/5/python-3-default-mac
# TODO: use conda instead?
brew install pyenv
pyenv install 3.10
pyenv global 3.10
pip install ansible
pip install ansible-lint
# Override default music app
brew install --cask notunes
defaults write digital.twisted.noTunes replacement /Applications/Spotify.app
# Make GPG use keychain (https://stackoverflow.com/a/41506446)
brew install pinentry-mac
brew install gpg2
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
# Install Composer & PHP code formatting tool.
brew install composer
composer global require squizlabs/php_codesniffer
composer global require drupal/coder
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
phpcs --config-set default_standard Drupal
# END Additions by DFG

# Remove outdated versions from the cellar.
brew cleanup
