
#alias tmux='TERM=xterm-256color tmux'
if which tmux 2>&1 >/dev/null && [ "${USER}" != "root" ]; then
    # if no session is started, attach to the last exitted session or start a new session
    test -z ${TMUX} && ( ( tmux ls | grep -v '(attached)$' && tmux attach ) || tmux )

    # when quitting tmux, try to attach to any unattached sessions
    while test -z ${TMUX}; do
        ( tmux ls | grep -v '(attached)$' && tmux attach ) || break
    done
fi

