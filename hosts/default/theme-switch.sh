#!/usr/bin/env bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/wallpapers"

# Ensure wallpaper directory exists
mkdir -p "$WALLPAPER_DIR"

# Use wofi to select a wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | wofi --show dmenu -p "Select Wallpaper")

# Exit if no wallpaper selected
[ -z "$WALLPAPER" ] && exit 1

# Set wallpaper with swww
swww img "$WALLPAPER" --transition-type wipe --transition-fps 60 --transition-duration 1

# Generate colors with pywal
wal -i "$WALLPAPER" -o ~/.config/hypr/scripts/reload-configs.sh

# Create reload-configs.sh to reload applications
cat > ~/.config/hypr/scripts/reload-configs.sh << 'EOF'
#!/usr/bin/env bash
# Reload Waybar
pkill waybar && waybar &

# Apply hyprland cols
COLOR0 = $(head -n 1 ~/.cache/wal/colors)
COLOR1 = $(head -n 2 ~/.cache/wal/colors | tail -n 1)
COLOR2 = $(head -n 3 ~/.cache/wal/colors | tail -n 1)
hyprctl setprop general:col.active_border "rgb(${COLOR0#\#})" lock
hyprctl setprop general:col.inactive_border "rgb(${COLOR1#\#})" lock
hyprctl setprop decoration:shadow.color "rgb(${COLOR2#\#})" lock



# Notify user
notify-send "Theme updated" "Wallpaper and colors applied"
EOF

chmod +x ~/.config/hypr/scripts/reload-configs.sh
