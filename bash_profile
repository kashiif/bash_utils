#!/usr/bin/env bash

# REPO_ROOT='/Users/kkhan/.bash_utils/bash_utils'
REPO_ROOT="$( dirname ${BASH_SOURCE[0]} )"

## Aliases
###########

alias ..='cd ..'
alias cd..='cd ..'
alias c='clear'

alias e='ember'

# git shourtcuts

alias g='git'
alias gcm='git checkout master'
alias gcd='git checkout dev'
alias gm='git merge'
alias ghash='git log -1 --format="%H"'
alias gdiff="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gdiffstaging='printf "\n\nstaging <-> develop\n\n" && gdiff staging...develop'
alias gdiffprod='printf "\n\nproduction <-> staging\n\n" &&  gdiff production...staging'

# docker shourtcuts
alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'
alias denv='eval $(docker-machine env)'
alias d-rm-stopped-containers='docker rm -v $(docker ps -a -q -f status=exited)'
alias d-rm-dangling-images='docker rmi $(docker images -f "dangling=true" -q)'
alias d-rm-all-containers='docker container rm $(docker container ls -a --format "{{.ID}}" )'
alias d-ls-containers='docker container ls --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}"'
alias d-ls-containers-names='docker container ls --format "{{.Names}}"'

# Make sublime work through the command line
alias sublime='"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"'
alias s='sublime'

alias ws='/usr/local/bin/webstorm'

alias t='open -a /Applications/TextWrangler.app'
alias nd='npm ls --depth 0'

#ack for ember projects
alias acka='ack --noignore-dir=node_modules --noignore-dir=bower_components --ignore-dir=tmp --ignore-dir=dist --follow'

#alias inb='npm install && bower install'
alias unb='rm -rf bower_components/ node_modules/'

alias myip="ipconfig getifaddr $(route -n get default|awk '/interface/ { print $2 }')"

alias y='yarn'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


################ Workplace related ######################
source "${REPO_ROOT}/scripts/msts/main.sh"
source "${REPO_ROOT}/scripts/review.sh"

################ Third Party Utilities (Manual install required first) ######################


## git command line auto completion
###################################
source "${REPO_ROOT}/3rd-party/git-completion.bash"

## hh - Bash and Zsh shell history suggest box
##############################################
# Bind hh to Bash Ctrl-r (Where Bash keymap is set to EMACS (default))
# hh : https://github.com/dvorka/hstr
# hh is installed into /usr/local/bin/hh
bind '"\C-r": "\C-ahh \C-j"'

export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"


################## Third Party Utilities from their github repos ############################


## git-aware-prompt
####################
export GITAWAREPROMPT="$REPO_ROOT/submodules/git-aware-prompt"
source "${GITAWAREPROMPT}/main.sh"

#export PS1="\[\033[38;5;27m\]\w\[\033[0m\] \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PS1="\[\033[48;5;33;38;5;15m\] \w  \[\033[48;5;15;38;5;33m\]▶ \[\033[48;5;15;38;5;76m\]\$git_branch\[$txtred\]\$git_dirty \[\033[0m\]\[\033[38;5;15m\]▶ \[$txtrst\]\$ "


## yarn-completion
####################
# This must happen before sourcing npm_install_autocomplete_bash otherwise yarn-completion will
# override our custom yarn autocompletion
source "$REPO_ROOT/submodules/yarn-completion/yarn-completion.bash"

## npm_install_autocomplete_bash
################################
# This must happen after sourcing yarn-completion otherwise it will override our
# custom yarn autocompletion
source "${REPO_ROOT}/submodules/npm_install_autocomplete_bash/.npm_install_autocomplete_bash"

## git-plus
####################
alias git-multi=${REPO_ROOT}/submodules/git-plus/git-multi
alias gitm=git-multi

alias git-recent=${REPO_ROOT}/submodules/git-plus/git-recent
alias gitr=git-recent

