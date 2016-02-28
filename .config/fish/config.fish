
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

#alias
alias vi vim
alias pip_update_all "pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"


#ssh
alias amino-server-dev "ssh -i ~/.ssh/NDDevKey.pem ubuntu@52.24.56.244"
alias amino-server2-dev "ssh -i ~/.ssh/NDDevKey.pem ubuntu@54.201.45.219"
alias amino-toolbox-dev "ssh -i ~/.ssh/NDDevKey.pem ubuntu@54.149.246.78"
alias amino-sendy-prd "ssh -i ~/.ssh/SendyAWS.pem ubuntu@52.35.123.244"
alias amino-toolbox-prd "ssh -i ~/.ssh/NDProductionKey.pem ubuntu@52.10.39.35"

#git
alias gst "git status"
alias gd "git diff"
alias gp "git push"
alias gl "git pull"
alias gr "git rebase"
alias gc "git checkout"
alias gb "git branch"
alias ga "git add"
alias gaa "git add ."
alias gcm "git commit -m"
alias grp "git rebase; and git push"
alias gsr "git stash; and git rebase; and git stash pop"
alias gsrp "git stash; and git rebase; and git push; and git stash pop"

if test (uname) = Darwin
  alias idea "open -a '/Applications/IntelliJ IDEA 15.app'"
  alias pyc "open -a '/Applications/PyCharm.app'"
  alias ws "open -a '/Applications/WebStorm.app'"
  alias pps "open -a '/Applications/PhpStorm.app'"
end
