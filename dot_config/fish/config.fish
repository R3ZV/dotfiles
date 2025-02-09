# Rust
abbr -a c cargo

# Git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'

# Misc
abbr -a vimdiff 'nvim -d'
abbr -a m make

# Zig
abbr -a zb 'zig build'

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

function todos
    set_color magenta
    cat $HOME/org/zet/todos.md | sed 's/^/ /'
    echo
    set_color normal
end

function fish_greeting
    todos

    echo -e (uname -ro | awk '{print "\\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uname -n | awk '{print "\\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
end

if status --is-interactive
    if test -e ~/Templates/fish/base16-gruvbox-dark-hard.fish
        builtin source ~/Templates/fish/base16-gruvbox-dark-hard.fish
    end
end


setenv DOCKER_DEFAULT_PLATFORM linux/amd64/v3

fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/share/nvm/v23.2.0/bin/
fish_add_path /usr/local/go/bin
fish_add_path ~/go/bin
fish_add_path /usr/pgadmin4/bin

set -x PAGER less
set -x EDITOR helix
set -x NVM_DIR $HOME/nvm
set -x WLR_NO_HARDWARE_CURSORS 1
set -x WLR_RENDERER_ALLOW_SOFTWARE 1


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.local/share/bob/nvim-bin $PATH

starship init fish | source
