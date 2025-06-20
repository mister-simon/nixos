{ pkgs }:
pkgs.writeShellScriptBin "hs" ''
  cd ~/work/homestead "''$(basename ''$PWD)" 2> /dev/null || cd ~/work/homestead
''
