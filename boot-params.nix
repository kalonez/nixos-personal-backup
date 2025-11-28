{ config, pkgs, lib, ... }:

{
  boot = {
    kernelParams = [
      "quiet"
      "loglevel=3"
      "acpi_osi="
      "acpi_osi=Windows" 
    ];

    consoleLogLevel = 3;

  };
}
