# NixOS Configuration for Lenovo LOQ 15IAX9
###### Overview
This is a personal NixOS configuration tailored for the Lenovo LOQ 15IAX9 laptop (specs: RTX 2050, Intel 12th Gen 12450HX). It should work for any laptop with this model.

## Features & Fixes
Most hardware issues resolved.

Includes both Sync Mode (performance) and Offload Mode (battery saving).
Pre-configured for KDE Plasma with relevant Lenovo utilities.

# Prerequisites
## Add Unstable Channel (Required)
* sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
* sudo nix-channel --update
* sudo nixos-rebuild switch

Recommended to keep both stable and unstable channels for flexibility.

# Performance Modes
Sync Mode (Performance)
CPU and GPU run together.

Enabled at boot as "gaming-time". If you use the gpu.nix file
In order to use it, put it inside the "imports" section on the file line like this ./gpu.nix

imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix ./gpu.nix
    ];

# Offload Mode (Battery/Travel)
GPU only activates on demand.

Use for better battery life.

GPU Activation in Offload Mode
To start the GPU only when needed (gaming/heavy tasks):
nvidia-offload %command% some-game

For Steam: add nvidia-offload %command% to game launch options.
Note: Only works in Offload Mode.

# Optional
KDE Plasma & Lenovo Tools
PlasmaVantage: Available in Discover Store (Plasma Addons section).

LenovoLegionLinuxGUI: Install via pkgs.lenovo-legion.

# Gaming & Proton
ProtonQT is easy to setup for downloading ProtonGE.

# Network
Quad9 DNS is set up by default.

# Troubleshooting KDE Plasma
If Plasma hangs or fans run high after gaming:
###### command works inside the terminal
##### plasmakillall
(This moves you to TTY automatically)

Then restart Plasma:
* startplasma

# Accessing TTY
* Ctrl+Alt+F1: Returns to current Plasma session (if available).

* Ctrl+Alt+F2/F3/F4: Switches to other TTYs.

Aliases work in any TTY.

# Useful Aliases
runs bash shell by default

###### Kill Plasma session
###### use alias ↓↓↓↓ in the terminal
* plasmakillall  

###### Start Plasma
###### use alias ↓↓↓↓
* startplasma    


###### use alias ↓↓↓↓ sudo nixos-rebuild switch
* update         


###### use alias ↓↓↓↓ sudo nix-collect-garbage -d
* clean          
 
###### use alias ↓↓↓↓ sudo nixos-rebuild switch
* rebuild        


###### Note: update and rebuild do the same thing – personal preference.

#### Important Notes
Some code was organized with AI assistance, but never let AI fully modify your NixOS configuration – it can break your system.
This setup runs Plasma separately for stability; lag or hangs are rare but recoverable via TTY.
