{ ... }:
{
  boot = {
    # Make the loader quieter
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_priority=3"
    ];
  };
}
