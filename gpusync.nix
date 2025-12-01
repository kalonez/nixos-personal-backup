{ config, lib, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;

  hardware.nvidia = {
    open = false;
  };


  hardware.nvidia.prime = {
    sync.enable = true;

    # integrated
    # amdgpuBusId = "PCI:6:0:0"
    intelBusId = "PCI:0:2:0";

    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };
}
