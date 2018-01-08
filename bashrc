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
	# Emacs
	# copies all bashrc_aliases to eshell/alias file.
	# must come after loading the aliases
	# copied from here: http://www.emacswiki.org/emacs/EshellAlias
    alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/eshell/alias 
fi

## Go lang
if [ -d "/usr/local/go" ] ; then
    export PATH="$PATH:/usr/local/go/bin"
fi

## Ocaml
. /home/nick/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Must install bash-completion first: apt-get install bash-completion
# https://github.com/szermatt/emacs-bash-completion
source /etc/bash_completion
###### kubernetes
source <(kubectl completion bash)

##### Heroku
export PATH="/usr/local/heroku/bin:$PATH"

####### Global Variables

# Set the editor to vim for mongodb
export EDITOR=/usr/bin/vim
export scripts="$HOME/Scripts"
# Emacs
export EMACS_HOME="$HOME/.emacs.d/"

# Java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

## aws bash autocompletion
complete -C '/usr/local/bin/aws_completer' aws

###### End Global Variables
