if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
# neovim
# export PATH="$PATH:/opt/nvim-linux64/bin"
set -gx PATH $PATH /opt/nvim-linux64/bin

#set -Ux PATH /home/seong/.local/bin /home/seong/bin $PATH

set -Ux PATH $HOME/.local/bin $HOME/bin $PATH

# sdkman -- java, groovy, scala, etc. version manager
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# can python finally work or what
set -gx PATH /home/seong/.local/bin $PATH
set -gx PYTHONPATH /home/seong/.local/lib/python3.12 $PYTHONPATH

pyenv init - | source

alias obsidian="flatpak run md.obsidian.Obsidian"
alias discord="com.discordapp.Discord"

# SDKMAN 
# Set SDKMAN_DIR environment variable
# set -x SDKMAN_DIR $HOME/.sdkman

# Source the SDKMAN initialization script if it exists
#if test -f "$SDKMAN_DIR/bin/sdkman-init.sh"
#    source "$SDKMAN_DIR/bin/sdkman-init.sh"
#end
