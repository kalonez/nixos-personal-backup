# gpu.nix

{ config, pkgs, ... }:

{
  # Enable graphics support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Select video drivers (e.g., NVIDIA)
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable NVIDIA modesetting for better X server integration
  hardware.nvidia.modesetting.enable = true;

  # Use the proprietary NVIDIA driver (do not use open-source nouveau)
  hardware.nvidia = {
    open = false;
  };

  # Enable NVIDIA PRIME offloading with sync enabled
  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = "PCI:0:2:0";  # Integrated GPU
    nvidiaBusId = "PCI:1:0:0";  # Dedicated NVIDIA GPU
  };
}

