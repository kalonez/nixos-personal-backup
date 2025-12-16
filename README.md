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

use ProtonQT to download ProtonGE. It should be installed if you use my configuration

I've setup up Quad9 too.
I've setup up several aliases and I admit I used AI to organize some code, but it is a must that you never use it to totally modified the system unless you want to break your OS. I had that happened to me so I don't like clankers... They can be very wrong.

I made KDE plasma launch seperately if it wants to suddenly break on me. I don't have to worry about sudden lag or hang or not working on me.
But for some reason as I set it up like this. I never have to worry about it. Only when I hear my fan go crazy after closing a game then I use "plasmakillall" (alias) in the terminal.

The aliases I frequently use in the terminal are


plasmakillall

startplasma

update ("sudo nixos-rebuild switch")

clean ("sudo nix-collect-garbage -d")

rebuild ("sudo nixos-rebuild switch") PS. Sometimes I forget


well you can see the alias "update" and "rebuild" does the same thing. I can be dumb sometimes.
