if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

#set -Ux PATH /home/seong/.local/bin /home/seong/bin $PATH

set -Ux PATH $HOME/.local/bin $HOME/bin $PATH

# can python finally work or what
set -gx PATH /home/seong/.local/bin $PATH
set -gx PYTHONPATH /home/seong/.local/lib/python3.12 $PYTHONPATH

pyenv init - | source


