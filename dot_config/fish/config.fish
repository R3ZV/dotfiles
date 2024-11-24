abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a m make
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'
abbr -a ct 'cargo t'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'

alias v="nvim"
alias jd="cd ~ && cd \$(find * -type d | fzf) && eza"
alias notes="cd ~ && cd org/notes"

if status --is-interactive
    if test -e ~/Templates/fish/base16-gruvbox-dark-hard.fish
        builtin source ~/Templates/fish/base16-gruvbox-dark-hard.fish
    end
end

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

if command -v bat >/dev/null
    abbr -a cat bat
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m' # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m' # begin bold
setenv LESS_TERMCAP_me \e'[0m' # end mode
setenv LESS_TERMCAP_se \e'[0m' # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m' # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m' # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'
setenv DOCKER_DEFAULT_PLATFORM linux/amd64/v3

function fish_user_key_bindings
    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
end

function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    set_color blue
    echo -n (hostnamectl hostname)
    if [ $PWD != $HOME ]
        set_color brblack
        echo -n ':'
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end

function fish_greeting
    set_color magenta
    cat $HOME/org/zet/kgbb.md | sed 's/^/ /'
    echo

    set_color normal
    echo -e (uname -ro | awk '{print "\\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uname -n | awk '{print "\\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
end

fish_add_path ~/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/share/nvm/v23.2.0/bin/
fish_add_path /usr/local/go/bin
fish_add_path /usr/pgadmin4/bin

set -x PAGER less
set -x EDITOR nvim
set -x NVM_DIR $HOME/nvm
set -x WLR_NO_HARDWARE_CURSORS 1
set -x WLR_RENDERER_ALLOW_SOFTWARE 1


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/razvan/.ghcup/bin $PATH # ghcup-env


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/r3zv/.opam/opam-init/init.fish' && source '/home/r3zv/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
