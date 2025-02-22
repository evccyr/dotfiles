if uwsm check may-start -q; then
    exec uwsm start hyprland-uwsm.desktop
fi

# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
