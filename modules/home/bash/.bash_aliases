function mkhs() {
  WORKSPACE_PWD=$PWD
  WORKSPACE_BASE="$(basename $PWD)"
  NEW_HOMESTEAD="~/work/homestead/$WORKSPACE_BASE"

  if [ -d $NEW_HOMESTEAD ]; then
    cd "$NEW_HOMESTEAD"
  else
    cd ~/work/homestead 2>/dev/null || return
    git clone https://github.com/laravel/homestead.git "$WORKSPACE_BASE"
    cd ~/work/homestead/$WORKSPACE_BASE || return
    git checkout release
    bash ./init.sh

    HOMESTEAD_FIND="~/code"
    sed -i "s#$HOMESTEAD_FIND#${WORKSPACE_PWD/\#/\\#}#" Homestead.yaml
    code -a Homestead.yaml
  fi
}
