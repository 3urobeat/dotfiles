# Endeavour OS (Arch) + Hyprland on Thinkpad Z13 G1
Install EOS using the default installer without a desktop.  
All other settings are irrelevant in order to use these dotfiles.  

&nbsp;

## What I install (contains AUR packages)
I use a bunch of KDE applications (ark, dolphin, gwenview, kate, ...) as I *really* like them.  
This causes a few more dependencies to be installed than I'd like but this is a compromise I have to make.

**General Packages:**
```
alacritty
archlinux-xdg-menu          // Probably needed for Dolphin Open With
ark
blueman
breeze
brightnessctl
btop
cliphist
dolphin
dunst
fastfetch
flameshot-git
fprintd
grim
gwenview
helvum
htop
hyprcursor
hypridle
hyprland
hyprlock
hyprpaper
kate
kde-cli-tools               // TODO: Does this solve Dolphin Open With?
kwallet
kwallet-pam
kwalletmanager
lib32-mesa
lib32-vulkan-radeon
libappindicator-gtk3
libreoffice-fresh
librewolf-bin
otf-font-awesome
playerctl
qt6ct
smile
tlp
tlpui
ttf-font-awesome
ttf-hack
ttf-hack-nerd
vlc
waybar
wlr-randr
wofi
xdg-desktop-portal
xdg-desktop-portal-hyprland
```

**Packages specific to my use case (programming, music production, ...):**
```
bitwig-studio
cmake
discord
docker
easyeffects
eslint
gimp
github-desktop-bin
google-chrome
kdenlive
lsp-plugins-lv2
lsp-plugins-vst
nextcloud-client
nodejs
npm
npm-check-updates
neovim

spotify-launcher
steam
thunderbird
ungoogled-chromium-bin
vital-synth
vscodium-bin
yabridge
yabridgectl
```

&nbsp;

Go ahead and fetch these dotfiles now.  
Copy any other data you have on a mounted flashdrive (use rsync to retain metadata: `rsync -a <src> <dest>`).

Reboot (if you feel like it).  
Start hyprland by running `Hyprland` in your tty.

&nbsp;

## Configuration after installation

### KWallet
**Create new wallet called 'kdewallet':** (use this name to support auto-unlock)  
Open `kwalletmanager5`, click on File > New Wallet.  
Input the name 'kdewallet', confirm, choose Blowfish encryption and provide the same password as your user account (this allows auto-unlock).

Should you already have copied your GPG keys, then you can now test your wallet.  
Running this command: `echo test | gpg --clearsign` should pop up a password dialog. Input the password of your GPG key and select the checkbox to save the key in your wallet.  
Upon reopening `kwalletmanager5`, you should now see the password added by GnuPG.

&nbsp;

### Fingerprint
**Enroll a new fingerprint:**  
Run `sudo fprintd-enroll $USER` to enroll your right index finger.  
Start touching your fingerprint sensor and you should see 'Enroll result: enroll-stage-passed' or '...enroll-retry-scan' being printed.  
Touch the sensor repeatedly with slightly varied finger positions until the process exits.

Enable & start the service:  
`sudo systemctl enable --now fprintd`

**Enable fprintd for Hyprlock:**  
Open `sudo nano /etc/pam.d/hyprlock` and make it look like this:
```
# PAM configuration file for hyprlock
# the 'login' configuration file (see /etc/pam.d/login)
auth sufficient pam_fprintd.so
auth requisite pam_deny.so
auth required pam_permit.so
auth        include     login
```

**Use it:**  
Lock your screen using `hyprlock` (Keybind in my config: META+L).  
Press ENTER once, then touch your fingerprint sensor. Your device should unlock.

&nbsp;

### TLP
TODO

&nbsp;

### Browser
**Set default browser:**  
First set to nothing, then to LibreWolf:  
```bash
export BROWSER=
xdg-settings set default-web-browser librewolf.desktop
```

&nbsp;

### Misc
**Fix Dolphin 'Open With' being empty:**  
Run `XDG_MENU_PREFIX=arch- kbuildsycoca6` and pray (optional)?  
I'm not 100% sure if this fixes it permanently.

**Add user group for non-root USB access:** (needed for PlatformIO Arduino Development)  
`sudo usermod -a -G uucp $USER`

**Make blueman-manager work:**  
`sudo systemctl enable --now bluetooth`  

**Disable annoying bluetooth tray icon:**  
Open `blueman-manager`, go to View > Plugins and disable 'StatusIcon'.

&nbsp;

**Disable Baloo:** (KDE file indexer)  
```bash
balooctl6 suspend
balooctl6 disable
balooctl6 purge
```

&nbsp;

**Add TrueNAS fstab entry:**  
Create mount point:  
`sudo mkdir /mnt/TrueNAS`

Run `sudo nano /etc/fstab` and add (replace IP and username with your values):  
`192.168.x.x:/mnt/data/username /mnt/TrueNAS nfs defaults,noauto,user 0 0`

&nbsp;

**Docker:**  
Start daemon: `sudo systemctl enable --now docker`  
Add yourself to group to use docker without sudo: `sudo usermod -a -G docker $USER`
