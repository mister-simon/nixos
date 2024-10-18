{
  description = ''
    This will store any local changes to a local hosts file.
    Copy this to ~/localhosts to be used as an untracked flake input.
  '';

  inputs = { };

  outputs =
    { self }:
    {
      hosts = {
        # "192.168.56.56" = [ "example.test" ];
      };
    };
}
