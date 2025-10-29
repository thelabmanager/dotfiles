# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Other system environment stuff
export GOPATH=$HOME/go

# Editors
export SYSTEMD_EDITOR=vim

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# History
export HISTFILESIZE=5000
export HISTSIZE=1000
# Don't add duplciate lines in the history
export HISTCONTROL=erasedups:ignoredups
shopt -s histappend
# Don't overwrite history, just add
PROMPT_COMMAND='history -a'

# Notifications
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

alias vi='vim'

# Terminal View
alias c='clear'
# Navigation

# Common file edits
alias vbash='vim ~/.bashrc'
alias sbash='source ~/.bashrc'
alias vvim='vim ~/.vimrc'
alias vghost='vim ~/.config/ghostty/config'
alias vtmux='vim ~/.tmux.conf'

# Utility
alias now='date "+%Y-%m-%d %A %T %Z"'

# Compiling and Building
alias buildifier='bazel run ~/source/read_only/buildtools/buildifier'

# Navigation
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias backdir='cd "$OLDPWD"'
alias code='cd ~/source'
alias last='cd ~/source/turbo-dev/conductor'
alias lastgame='cd ~/source/turbo-dev/option-one'

# List
alias la='ls -Alh'

# Search
alias p="ps aux | grep "

# Git
alias gbr='git branch'
alias gpush='git push'
alias gpull='git pull'
alias gcomm='git commit -m'
alias gamend='git commit --amend -m'
alias gmend='git commit --amend -m'
alias gst='git status'
alias gdf='git diff'
alias gad='git add'
alias gadd='git add'
alias gch='git checkout'
alias gchb='git checkout -b'
. "$HOME/.cargo/env"
