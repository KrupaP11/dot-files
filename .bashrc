# Set a simple path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/velvet.omp.json)"
~/.config/oh-my-posh/velvet.omp.json
# Setting up the colors I want
Purple=$(tput setaf 135);
Blue=$(tput setaf 033);
white=$(tput setaf 15);
bold=$(tput bold);
reset=$(tput sgr0);

# Set a simple prompt
PS1="\[${bold}\]\n";
PS1+="\[${Purple}\]\h"; # Purple hostname
PS1+="\[${Blue}\]:\W"; #Blue directory
PS1+="\n"
PS1+="\[${white}\] \$ \[${reset}\]"; # white $ and then reset
export PS1;

# Set default editor
export EDITOR='nano'

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

