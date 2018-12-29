ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

plugins=(extract z git git-extras kubectl kube-ps1 helm gitignore mvn bower gitfast github npm python pip docker zsh-autosuggestions zsh-syntax-highlighting)

if [ -f ~/.alias_profile ]; then
    . ~/.alias_profile
fi

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    ulimit -n 65536 65536
    plugins+=(brew brew-cask)
    alias idea="open -a '/Applications/IntelliJ IDEA.app'"
    alias pyc="open -a '/Applications/PyCharm.app'"
    alias ws="open -a '/Applications/WebStorm.app'"
    alias pps="open -a '/Applications/PhpStorm.app'"
    alias vs="open -a '/Applications/Visual Studio Code.app'"
    alias sbl="open -a '/Applications/Sublime Text.app'"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    export HOMEBREW_NO_AUTO_UPDATE=1

fi

if [[ $('uname') =~ 'CYGWIN' ]]; then
fi

if [ -f ~/.env_profile ]; then
    . ~/.env_profile
fi

source $ZSH/oh-my-zsh.sh


if [[ $('uname') == 'Darwin' ]]; then
    test -e "/usr/local/opt/kube-ps1/share/kube-ps1.sh" && source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
    PS1='$(kube_ps1)'$PS1
fi

