# Arch wiki about gnome keyring says we should do this
dbus-update-activation-environment --all

# Start gnome keyring manually which is required when starting from tty using startx
eval $(/usr/bin/gnome-keyring-daemon --replace --daemonize --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL
export SSH_AUTH_SOCK

# Make qt5ct work
export QT_QPA_PLATFORMTHEME=qt5ct

# Let dolphin have icons
#export XDG_CURRENT_DESKTOP=KDE

exec i3
