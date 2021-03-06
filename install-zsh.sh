#!/bin/zsh

# Install prezto
rm -rf "${ZDOTDIR:-$HOME}/.zprezto" || true
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# Install fonts (using Meslo + Solarized dark)
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git  ~/.zprezto/modules/prompt/external/powerlevel9k
ln -s ~/.zprezto/modules/prompt/external/powerlevel9k/powerlevel9k.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup

# install zsh config files
cp -f ./.zpreztorc ~/.zpreztorc
cp -f ./.zshrc ~/.zshrc
cp -f ./.env ~/.env
