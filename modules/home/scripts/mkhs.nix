{ pkgs }:
pkgs.writeShellScriptBin "mkhs" ''
  workspace_pwd=''$PWD
  workspace_base="''$(basename ''$PWD)"
  new_homestead="~/work/homestead/''$workspace_base"

  if [ -d ''$new_homestead ]; then
      cd "''$new_homestead"
  else
      cd ~/work/homestead 2> || exit
      git clone https://github.com/laravel/homestead.git "''$workspace_base"
      cd "~/work/homestead/''$workspace_base" 2> || exit
      git checkout release
      bash ./init.sh
      code -a Homestead.yaml
      echo ''$workspace_pwd
  fi
''
