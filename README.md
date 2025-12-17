NixOS Configuration for Lenovo LOQ 15IAX9
Overview
This is a personal NixOS configuration tailored for the Lenovo LOQ 15IAX9 laptop (specs: RTX 2050, Intel 12th Gen 12450HX). It should work for any laptop with this model.

Features & Fixes
Most hardware issues resolved.

Includes both Sync Mode (performance) and Offload Mode (battery saving).

Pre-configured for KDE Plasma with relevant

This setup has both sync and offload mode together. If you use the gpu.nix file
In order to use it you have to put it the configuration inside the imports section like this ./gpu

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
But for some reason as I set it up like this. I never have to worry about it. Only when I hear my fan go crazy after closing a game then I use "plasmakillall" (alias) in the terminal. It then puts me automatically to TTY, after that I use "startplasma". The aliases are for ease of use. I don't like to type a whole string of line or command to launch something simple

The aliases I frequently use in the terminal are


plasmakillall

startplasma

update ("sudo nixos-rebuild switch")

clean ("sudo nix-collect-garbage -d")

rebuild ("sudo nixos-rebuild switch") PS. Sometimes I forget

you can easily launch TTY if KDE Plasma does stop working

Ctrl+Alt+F1 or Ctrl+Alt+F2 or Ctrl+Alt+F3 or Ctrl+Alt+F4

F1 is most likely going to the environment you're in which is KDE plasma :)

The aliases will work no matter which TTY you're in.
TTY-1, TTY-2 or TTY-3

well you can see the alias "update" and "rebuild" does the same thing. I can be dumb sometimes.
