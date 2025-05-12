{ ... }:
{
  # Enabling xremap
  hardware.uinput.enable = true;
  users.groups.uinput.members = [ "simon" ];
  users.groups.input.members = [ "simon" ];

  services.kanata = {
    enable = true;
    keyboards.laptop = {
      configFile = ../../sources/kanata/laptop.kbd;
    };
  };
}
