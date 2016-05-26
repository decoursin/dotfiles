# history
HISTSIZE=40000
HISTFILESIZE=80000

# Paths
export PATH=$PATH:~/Scripts
export PATH="$PATH:${HOME}/bin"
export PATH=$PATH:~/Typesafe
export PATH=$PATH:~/Idea/bin
export PATH=$PATH:~/WebStorm-139.252/bin

# foodbio project | Laravel vendor/bin directory
export PATH=$PATH:~/foodbio/vendor/bin/

# composer directory
export PATH=$PATH:~/.composer/vendor/bin/

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
if [ -d "$HOME/go" ] ; then
	export GOPATH="$HOME/go"
fi
if [ -d "$HOME/go/bin" ] ; then
	PATH="$HOME/go/bin:$PATH"
fi

# Must install bash-completion first: apt-get install bash-completion
# https://github.com/szermatt/emacs-bash-completion
source /etc/bash_completion

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

####### Global Variables

# Set the editor to vim for mongodb
export EDITOR=/usr/bin/vim
export scripts="$HOME/Scripts"
# Emacs
export EMACS_HOME="$HOME/.emacs.d/"

###### End Global Variables

###### Valsight

export PATH="~/bin/Sencha/Cmd/5.1.3.61:$PATH"
export SENCHA_CMD_3_0_0="~/bin/Sencha/Cmd/5.1.3.61"

##### End Valsight

