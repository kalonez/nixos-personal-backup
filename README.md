# *RUNNING STABLE KERNEL. THE BEST ONE SO FAR!*
###### To find pci ids
*nix shell nixpkgs#pciutils -c lspci | grep ' VGA '


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
  
## I've enable flatpak service
* flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
* flatpak update
 ###### Using programs like Inkscape or Kdenlive or Kritta without worrying about downloading or putting additional dependencies. It is too much of a hassle with a moving goal post just to make it work. Including screen recorders like OBS. Easier to install them directly through flatpak. On KDE the Discover app should work on the get-go after installing flatpak

# Performance Modes
Sync Mode (Performance)
CPU and GPU run together.

Enabled at boot as "gaming-time". 
##### If you use the *gpu.nix* file
In order to use it, put it inside the "imports" section on the file line like this *./gpu.nix*

imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix ./gpu.nix
    ];

# Offload Mode (Battery/Travel)
GPU only activates on demand.

Use for better battery life.

##### GPU Activation in Offload Mode
To start the GPU only when needed (gaming/heavy tasks):
*nvidia-offload %command% some-game*

##### For Steam: add nvidia-offload %command% to game launch options.
*Note: Only works in Offload Mode.*

### Optional
KDE Plasma & Lenovo Tools
PlasmaVantage: Available in Discover Store (Plasma Addons section).

LenovoLegionLinuxGUI: Install via pkgs.lenovo-legion.

### Gaming & Proton
ProtonQT is easy to setup for downloading ProtonGE.

### Network
Quad9 DNS is set up by default.

# Troubleshooting KDE Plasma
If Plasma hangs or fans run high after gaming:
###### command works inside the terminal
* plasmakillall  *(This moves you to TTY automatically)*

Then restart Plasma:
* startplasma

# Accessing TTY
* **Ctrl+Alt+F1:** *Returns to current Plasma session (if available).*

* **Ctrl+Alt+F2/F3/F4:** *Switches to other TTYs.*

*Aliases work in any TTY.*

### Useful Aliases
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

##### Important Notes
Some code was organized with AI assistance, **but never let AI fully modify your NixOS configuration** – it can break your system.
###### **You'll have a very bad time. AI = BAD NEWS. Don't use AI if you don't understand code**

This setup runs Plasma separately for stability; lag or hangs are rare but recoverable via TTY.
## Don't forget to use the "update --upgrade" after you've applied this configuration if not, use:
###### It will update itself to the most up-to date nixos repos including your drivers 
* sudo nixos-rebuild switch --upgrade
#### Don't forget to change the username(kalon)  to yours



PS I've quit using NixOS. No operating system is perfect to be honest. It has its quirks.
