if status is-interactive
    # Commands to run in interactive sessions can go here
    pokemon-colorscripts -r --no-title
    alias cat="bat --theme="Dracula""
    alias nap="go/bin/nap"
    alias df="duf"
    set -gx EDITOR nvim
    set -gx PATH /usr/local/cuda-12.0/bin $PATH
    set -gx LD_LIBRARY_PATH /usr/local/cuda-12.0/lib64 $LD_LIBRARY_PATH
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
    #fish_add_path /home/brasi/.spicetify
end

#idk why i did this
#fish_add_path /home/brasi/.spicetify

#needed so that ranger can open files in nvim - works without?
#set -gx EDITOR nvim

oh-my-posh init fish --config ~/.poshthemes/flow.omp.json | source
#starship init fish | source
begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end
