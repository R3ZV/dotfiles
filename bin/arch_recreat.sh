!/usr/bin/env bash

sudo pacman -Syu neofetch unzip zip git eza bacon tree fzf bottom pandoc \
pulseaudio ripgrep bat fd typst mold valgrind make just gdb tokei pkg-config bob \
qemu-full ninja cmake sqlite grim terminus-font hyperfine ttf-iosevka-nerd polybar \
ttf-jetbrains-mono noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
fish zathura rnote pavucontrol man-db docker openssl mdbook dconf github-cli \
tmux love zathura-pdf-mupdf picom starship feh swww waybar wireplumber \
wl-clipboard pipewire-pulse rofi-wayland meson scdoc wayland-protocols

bob install stable

cd ~/

wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go*.tar.gz
rm go*.tar.gz

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer

mkdir bin
mkdir dev

git clone git@github.com:R3ZV/org.git

curl -L https://github.com/marler8997/zigup/releases/download/v2025_01_02/zigup-x86_64-linux.tar.gz | tar xz
mv zigup bin 

curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash

zigup fetch master
zigup default master

echo /sbin/fish | sudo tee -a /etc/shells
chsh -s /sbin/fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo "REBOOT"
