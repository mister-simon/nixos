function mkhs() {
  workspace_pwd=$PWD
  workspace_base="$(basename $PWD)"
  new_homestead="~/work/homestead/$workspace_base"

  if [ -d $new_homestead ]; then
    cd "$new_homestead"
  else
    cd ~/work/homestead 2>/dev/null || return
    git clone https://github.com/laravel/homestead.git "$workspace_base"
    cd ~/work/homestead/$workspace_base || return
    # cd "~/work/homestead/$workspace_base" 2>/dev/null || return
    git checkout release
    bash ./init.sh
    code -a Homestead.yaml
    echo $workspace_pwd
  fi
}
