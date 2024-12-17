# Nix shell aliases
alias nrb="sudo nixos-rebuild boot --flake ~/nixos/#$HOSTNAME"
alias nrs="sudo nixos-rebuild switch --flake ~/nixos/#$HOSTNAME"
alias setup-hosts="nix registry add localhosts path:/home/simon/localhosts"
alias update-hosts="nix flake update --flake ~/nixos localhosts"

# Config
alias hosts="code ~/localhosts"

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

# Sail
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Homestead
function hs() {
    cd homestead "$(basename $PWD)" || cd homestead
}

# When called from a project folder "~/code/some-project"
# Will create a new homestead installation at "~/code/homestead/some-project"
# And load the homestead.yaml up in vscode
function mkhs() {
    workspace_pwd=$PWD
    workspace_base="$(basename $PWD)"
    new_homestead="~/code/homestead/$workspace_base"

    if [ -d $new_homestead ]; then
        cd "$new_homestead"
    else
        cd ~/code/homestead || exit
        git clone https://github.com/laravel/homestead.git "$workspace_base"
        cd "$workspace_base"
        git checkout release
        bash ./init.sh
        code -a Homestead.yaml
        echo $workspace_pwd
    fi
}
