{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;  # Proprietary driver

    # Optional optimizations:
    powerManagement.enable = true;  # Better power management
    # forceFullCompositionPipeline = true;  # Uncomment if screen tearing

    # Use stable driver package
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # CORRECT: Use hardware.graphics instead of hardware.opengl
  hardware.graphics = {
    enable = true;           # Replaces hardware.opengl.enable
    enable32Bit = true;      # Replaces hardware.opengl.driSupport32Bit
  };

}
