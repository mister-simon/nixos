{ pkgs }:

pkgs.writeShellScriptBin "update-hosts" ''
  if [ -f ~/hosts ]; then
    echo "Before:"
    cat /etc/hosts
    echo ""
    echo "" >>/etc/hosts
    cat ~/hosts >>/etc/hosts
    echo ""
    echo "After:"
    cat /etc/hosts
  else
    echo "No ~/hosts file. Create it, then rerun."
    nvim ~/hosts
  fi
''
