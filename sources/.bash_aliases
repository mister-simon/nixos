# Homestead
function hs() {
    cd homestead "$(basename $PWD)" || cd homestead
}

# When called from a project folder "~/code/some-project"
# Will create a new homestead installation at "~/code/homestead/some-project"
# And load the homestead.yaml up in vscode
function mkhs() {
    CODEDIR=${1:-"code"}
    workspace_pwd=$PWD
    workspace_base="$(basename $PWD)"
    new_homestead="~/$CODEDIR/homestead/$workspace_base"

    if [ -d $new_homestead ]; then
        cd "$new_homestead"
    else
        cd ~/$CODEDIR/homestead || exit
        git clone https://github.com/laravel/homestead.git "$workspace_base"
        cd "$workspace_base"
        git checkout release
        bash ./init.sh
        code -a Homestead.yaml
        echo $workspace_pwd
    fi
}
