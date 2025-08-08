# For the header that kept showing up.
export BASH_SILENCE_DEPRECATION_WARNING=1

# Load .bashrc if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
