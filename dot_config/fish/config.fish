# Git
abbr -a gc 'git commit'
abbr -a ga 'git add -p'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'
abbr -a gs 'git status --short'

# Misc
abbr -a vimdiff 'nvim -d'

alias v="nvim"
alias hx="helix"
alias jd="cd ~ && cd \$(find * -type d | fzf) && eza"

if command -v eza >/dev/null
    abbr -a l eza
    abbr -a ls eza
    abbr -a ll 'eza -l'
    abbr -a lll 'eza -la'
else
    abbr -a l ls
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

function fish_greeting
    echo -e (uname -ro | awk '{print "\\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uname -n | awk '{print "\\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
end

if status --is-interactive
    # set theme = tokyonight.fish
    set theme = base16-gruvbox-dark-hard
    if test -e "~/Templates/fish/$theme.fish"
        echo "Templates/fish/$theme.fish"
        builtin source "~/Templates/fish/$theme.fish"
    end
end

setenv DOCKER_DEFAULT_PLATFORM linux/amd64/v3

fish_add_path ~/bin
fish_add_path ~/jlink
fish_add_path ~/srecord/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/share/nvm/v23.11.0/bin/
fish_add_path /usr/local/go/bin
fish_add_path ~/go/bin
fish_add_path /usr/lib/jvm/java-21-openjdk/bin
fish_add_path /usr/pgadmin4/bin

set -x PAGER less
set -x MANPAGER 'nvim +Man!'
set -x EDITOR helix
set -x NVM_DIR $HOME/nvm
set -x WLR_NO_HARDWARE_CURSORS 1
set -x WLR_RENDERER_ALLOW_SOFTWARE 1

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME

starship init fish | source

# ZVM
set -gx ZVM_INSTALL "$HOME/.zvm/self"
set -gx PATH $PATH "$HOME/.zvm/bin"
set -gx PATH $PATH "$ZVM_INSTALL/"
