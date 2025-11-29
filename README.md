# nixos-personal-backup
I'm personally setting this up for Lenovo LOQ 15IAX9
The Specs are RTX 2050 and Intel 12th Gen 12450HX, but that doesn't matter any laptop with the Model LOQ 15IAX9 should work perfectly fine
I've fixed most of the issues and still working on it as I'm not able to find anything about this particular Laptop
If you are on KDE "PlasmaVantage"(can be found from the Discover store in Plasma addons section"), and "LenovoLegionLinuxGUI"(pkgs.lenovo-legion) will work with no hassle. 

This setup has both sync and offload mode together. 

Offload mode is for travelling and longer battery life. 
Sync mode is performance mode, both cpu and gpu running at the same time.

"gaming-time" at boot is Sync mode

If you want the gpu to start only when you are doing heavy tasks or gaming you have to use this command (Only works in Offload mode)

nvidia-offload %command% some-game (alas


or have it in steam game launch options 
nvidia-offload %command%   (Only works in Offload mode. Remove if you're not using offload mode)
