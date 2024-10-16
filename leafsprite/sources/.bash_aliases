# Config
alias hosts="code /etc/hosts"

# Git
alias gs="git status"
alias gd="git diff"
alias gc="git commit -m"
alias gam="git commit --amend --no-edit"
alias game="git commit --amend"
alias gaa="git add -A"
alias ga="git add ."
alias gp="git push"

# VMs
alias vu="vagrant up --provision"
alias vh="vagrant halt"
alias vr="vagrant reload --provision"
alias vssh="vagrant ssh"

# Homestead
function hs() {
    cd homestead "$(basename $PWD)" || cd homestead
}
