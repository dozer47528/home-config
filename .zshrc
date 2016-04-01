ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"

plugins=(extract z git git-extras git-flow gitignore mvn bundler bower gitfast github npm vagrant python pip pyenv docker zsh-autosuggestions zsh-completions zsh_reload)

if [ -f ~/.alias_profile ]; then
    . ~/.alias_profile
fi

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew brew-cask)
    alias idea="open -a '/Applications/IntelliJ IDEA 15.app'"
    alias pyc="open -a '/Applications/PyCharm.app'"
    alias ws="open -a '/Applications/WebStorm.app'"
    alias pps="open -a '/Applications/PhpStorm.app'"
fi

if [[ $('uname') =~ 'CYGWIN' ]]; then
fi

if [ -f ~/.env_profile ]; then
    . ~/.env_profile
fi

plugins+=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#setting
command -v pyenv >/dev/null 2>&1 && {eval "$(pyenv init -)";}
command -v pyenv-virtualenv-init>/dev/null 2>&1 && {eval "$(pyenv virtualenv-init -)";}

autoload -U compinit && compinit
