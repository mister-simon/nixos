{ profile, ... }:
{
  environment.shellAliases = {
    # Zaney
    sv = "sudo nvim";
    v = "nvim";
    c = "clear";
    fr = "nh os switch --hostname ${profile}";
    fb = "nh os boot --hostname ${profile}";
    fu = "nh os switch --hostname ${profile} --update";
    ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
    cat = "bat";
    man = "batman";
    ls = "eza --icons --group-directories-first -1";
    ll = "eza --icons -lh --group-directories-first -1 --no-user --long";
    la = "eza --icons -lah --group-directories-first -1";
    tree = "eza --icons --tree --group-directories-first";

    # Git
    gs = "git status";
    gd = "git diff";
    gc = "git commit -m";
    gam = "git commit --amend --no-edit";
    game = "git commit --amend";
    gaa = "git add -A";
    ga = "git add .";
    gp = "git push";

    # Vagrant / Sail
    vu = "vagrant up --provision";
    vh = "vagrant halt";
    vr = "vagrant reload --provision";
    vssh = "vagrant ssh";
    sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";

    # Zellij
    zj = ''
      zellij a --create ''${PWD//\//}
    '';

    # Homestead
    hs = ''
      cd ~/code/homestead/$(basename $PWD) 2> /dev/null || cd ~/code/homestead 2> /dev/null || echo "Can't find homestead dir"
    '';
  };
}
