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

  programs = {
    git = {
      enable = true;
      userName = "Simon W";
      userEmail = "4751279+mister-simon@users.noreply.github.com";
    };

    home-manager.enable = true;
  };

}
