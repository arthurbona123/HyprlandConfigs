#!/bin/bash

git clone https://github.com/zsh-users/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions

git clone https://github.com/romkatv/powerlevel10k

mv zsh-autosuggestions /usr/share/zsh-plugins
mv zsh-syntax-highlighting /usr/share/zsh-plugins
mv powerlevel10k /usr/share/zsh-themes

usermod -s /usr/bin/zsh root
vipw

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "source /usr/share/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /home/$USER/.zshrc

echo "source /usr/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> /home/$USER/.zshrc

echo "source /usr/share/zsh-themes/powerlevel10k/powerlevel10k.zsh-theme"
