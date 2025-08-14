# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z history-substring-search pip python conda fzf extract aliases sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# In your ~/.zshrc
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/velvet.omp.json)"

############################################################

# >>> juliaup initialize >>>

############################################################

# !! Contents within this block are managed by juliaup !!

path=('/Users/krupapothiwala/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

export PS1="%1~ %# "

autoload -U select-word-style
select-word-style bash

autoload -U colors
colors

# history options
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt inc_append_history   # append to history immediately (incrementally)
setopt hist_ignore_all_dups # keep all history lines unique (not just adjacent ones)
setopt hist_ignore_space    # allow incognito commands
setopt hist_reduce_blanks
unsetopt extended_history

setopt auto_cd          # cd if only directory name entered
setopt beep             # beep on error in ZLE
setopt extended_glob    # treat '#', '~', and '^' as part of patterns in globs
setopt notify           # immediately report on background jobs
setopt print_exit_value # print exit value of programs if they errored
unsetopt case_glob      # case-(in)sensitive globbing

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

autoload -Uz vcs_info # version control stuff for prompt
precmd() { vcs_info }

# Prompt options
zstyle ':vcs_info:*' formats '(%b)'
colored_prompt=1
if [ $colored_prompt -eq 1 ]; then              # colored prompt
    machineinfo="%{$bold_color$fg[green]%}%n@%m%{$reset_color%}"
    dirinfo="%{$bold_color$fg[cyan]%}[%~]%{$reset_color%}"
else                                            # plain prompt
    machineinfo="%n@%m"
    dirinfo="[%~]"
fi
vcsinfo='${vcs_info_msg_0_}'
NEWLINE=$'\n'
export PS1="$dirinfo $vcsinfo$NEWLINE$machineinfo %% "
export PS2="${PS1/\%\%/>}" #same as PS1, only an angle bracket as the final char

# vi: set filetype=zsh:

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

