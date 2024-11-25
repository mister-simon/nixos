{ ... }:
{
  home = {
    username = "simon";
    homeDirectory = "/home/simon";

    stateVersion = "24.05";

    packages = [ ];
    file = { };
    sessionVariables = { };
  };

  programs.home-manager.enable = true;
}
