

## ~/.inputrc

    "\e[A": history-search-backward
    "\e[B": history-search-forward
    set show-all-if-ambiguous on
    set completion-ignore-case on

## ~/.bashrc

    HISTFILESIZE=1000000
    HISTSIZE=1000000
    HISTCONTROL=ignoreboth
    HISTTIMEFORMAT='%F %T '

    # Record each line to history as you issue it
    PROMPT_COMMAND='history -a'

## shell

    # Make history to be appended to the .bash_history file rather than overwriting it.
    shopt -s histappend

    # force commands that you entered on more than one line to be adjusted to fit on only one
    shopt -s cmdhist