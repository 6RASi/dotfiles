if status is-interactive
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
end


#oh-my-posh init fish --config ~/.poshthemes/flow.omp.json | source
#starship init fish | source
