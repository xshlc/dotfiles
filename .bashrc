# .bashrc

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export GOPATH=$HOME/go

# $JAVA_HOME setup for maven
#export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.13.0.11-1.fc40.x86_64
#export PATH=$JAVA_HOME/bin:$PATH

# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

# aliases
alias obsidian='flatpak run md.obsidian.Obsidian'
alias discord='com.discordapp.Discord'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## customizing colors and such
HISTSIZE=-1
HISTFILESIZE=-1 # Infinite history.

# Specify a maximum size for the history file (e.g., 5MB)
MAX_HISTORY_FILE_SIZE=5242880 # 5MB in bytes
#MAX_HISTORY_FILE_SIZE=10485760  # 10MB in bytes
# Avoid storing duplicate commands in history
HISTCONTROL=ignoredups:erasedups # Ignore duplicate commands, and remove older duplicates

# Append new history lines instead of overwriting the history file
shopt -s histappend

# Function to trim the history file to 5MB
trim_history_file() {
    local history_file="$HISTFILE"
    local max_size=$MAX_HISTORY_FILE_SIZE

    # Check if the file exists and exceeds the maximum size
    if [ -f "$history_file" ] && [ "$(stat -c %s "$history_file")" -gt "$max_size" ]; then
        # Truncate the file to the last MAX_HISTORY_FILE_SIZE bytes
        tail -c "$max_size" "$history_file" >"${history_file}.tmp" && mv "${history_file}.tmp" "$history_file"
    fi
}

# Trim the history file when the shell exits
PROMPT_COMMAND="trim_history_file; $PROMPT_COMMAND"

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

alias ls='ls --color'
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS
