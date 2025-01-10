
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# Neovim
set -gx PATH $PATH /opt/nvim-linux64/bin

#set -Ux PATH /home/seong/.local/bin /home/seong/bin $PATH
set -Ux PATH $HOME/.local/bin $HOME/bin $PATH


# Aliases
alias obsidian='flatpak run md.obsidian.Obsidian'
alias discord='com.discordapp.Discord'

# Python related settings
set -gx PATH /home/seong/.local/bin $PATH
set -gx PYTHONPATH /home/seong/.local/lib/python3.12 $PYTHONPATH

pyenv init - | source

# Set JAVA_HOME path for Maven
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk-17.0.13.0.11-3.fc40.x86_64 
set -gx PATH $JAVA_HOME/bin $PATH

