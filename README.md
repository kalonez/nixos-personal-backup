# nixos-personal-backup
I'm personally setting this up for Lenovo LOQ 15IAX9.
The Specs are RTX 2050 and Intel 12th Gen 12450HX, but that doesn't matter as any laptop with the Model LOQ 15IAX9 should work perfectly fine.
I've fixed most of the issues and still working on it as I'm not able to find anything about this particular Laptop.
If you are on KDE "PlasmaVantage"(can be found from the Discover store in Plasma addons section"), and "LenovoLegionLinuxGUI"(pkgs.lenovo-legion) will work with no hassle. 

This setup has both sync and offload mode together. 

Offload mode is for travelling and longer battery life. 
Sync mode is performance mode, both cpu and gpu running at the same time.

"gaming-time" at boot is Sync mode

If you want the gpu to start only when you are doing heavy tasks, or gaming then you have to use this command (Only works in Offload mode)

"nvidia-offload %command% some-game" (without apostrophes)





"nvidia-offload %command%"  (or have it in steam game launch options without the apostrophes)

(Only works in Offload mode. Remove if you're not using offload mode)


MUST


If you use this, you have to add the unstable branch
using the terminal [Good having both stable and unstable branch and later download any packages without hassle]

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable


sudo nix-channel --update


sudo nixos-rebuild switch



To install proton-ge to steam 
just put this in the terminal "protonup" (without the apostrophes)

protonup

it will install directly to steam only if you haven't removed the protonup package and the custom path that is directed to it.

after that proton-ge should update itself from steam. If not my bad. I'll figure something out.
