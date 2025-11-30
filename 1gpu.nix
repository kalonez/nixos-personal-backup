# gpu.nix

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

 # hardware.nvidia.prime = {
  #  sync.enable = true;
   # intelBusId = "PCI:0:2:0";  # Integrated GPU
   # nvidiaBusId = "PCI:1:0:0";  # Dedicated NVIDIA GPU
 # };
 
   hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    # integrated
    intelBusId = "PCI:0:2:0";
    # amdgpuBusId = "PCI:6:0:0"
    
    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };

  specialisation = {
    gaming-time.configuration = {

      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };

    };
  };
 
}

