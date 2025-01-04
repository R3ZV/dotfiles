!/usr/bin/env bash

sudo pacman -Syu neofetch unzip zip git eza bacon tree fzf bottom pandoc \
pulseaudio ripgrep bat fd typst mold valgrind make just gdb tokei pkg-config bob \
qemu-full ninja cmake sqlite grim terminus-font hyperfine ttf-iosevka-nerd polybar \
ttf-jetbrains-mono noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
fish zathura rnote pavucontrol man-db docker openssl mdbook dconf github-cli \
tmux love zathura-pdf-mupdf

bob install stable

echo /sbin/fish | sudo tee -a /etc/shells
chsh -s /sbin/fish

cd ~/

wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go*.tar.gz
rm go*.tar.gz


curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

mkdir dev
git clone git@github.com:R3ZV/org.git

echo "REBOOT"
