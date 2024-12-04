{ pkgs, inputs, ... }:
{
  imports = [
    inputs.xremap-flake.nixosModules.default
  ];

  # Enabling xremap
  hardware.uinput.enable = true;
  users.groups.uinput.members = [ "simon" ];
  users.groups.input.members = [ "simon" ];

  services.xremap = {
    withGnome = true;
    userName = "simon";
    config = {
      keymap = [
        {
          name = "main";
          remap = {
            "capslock" = "backspace";
          };
        }
      ];
    };
  };
}
