# history
HISTSIZE=40000
HISTFILESIZE=80000

# Paths
export PATH=$PATH:~/Scripts
export PATH="$PATH:${HOME}/bin"
export PATH=$PATH:~/.composer/vendor/bin/


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## Node
# https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
# Install npm packages globally without sudo
NPM_PACKAGES="$HOME/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

if [ -f ~/.bashrc_aliases ];then
	source ~/.bashrc_aliases
fi

# Emacs
# copies all bashrc_aliases to eshell/alias file.
# must come after loading the aliases
# copied from here: http://www.emacswiki.org/emacs/EshellAlias
if [ -d ~/.emacs.d/ ];then
    alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/eshell/alias 
fi

## Go lang
if [ -d "/usr/local/go" ] ; then
    # GOROOT is for the executable
    export GOROOT="/usr/local/go"
    export PATH="$PATH:$GOROOT/bin"
    # GOPATH is for the src code
    export GOPATH="$HOME/go"
    export PATH="$PATH:$GOPATH/bin"
fi

## Ocaml
. /home/nick/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Must install bash-completion first: apt-get install bash-completion
# https://github.com/szermatt/emacs-bash-completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###### kubernetes
source <(kubectl completion bash)
minikube docker-env 2> /dev/null && eval $(minikube docker-env)
export DOCKER_HOST_IP=$(echo "$DOCKER_HOST" | sed 's/tcp:\/\///' | sed 's/:.*//g')
if [ -x "$(command -v helm)" ]; then
  source <(helm completion bash)
fi


##### Heroku
export PATH="/usr/local/heroku/bin:$PATH"

##### aws bash autocompletion
complete -C '/home/nick/.local/bin/aws_completer' aws

####### Global Variables

# Set the editor to vim for mongodb
export EDITOR=/usr/bin/vim
export scripts="$HOME/Scripts"
# Emacs
export EMACS_HOME="$HOME/.emacs.d/"

# Java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

###### End Global Variables

############################################## bash coloring


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

