#!/bin/bash
# script to set random background wallpapers on my GNOME desktop
# set base path
#gsettings set org.gnome.desktop.background picture-uri "file:/mnt/hgfs/Proyectos/WallPapers/6277.jpg"
export wallpaper_path=$1
shopt -s nullglob
# store all the image file names in wallpapers array
wallpapers=(
    "$wallpaper_path"/*.jpg
    "$wallpaper_path"/*.jpeg
    "$wallpaper_path"/*.png
    "$wallpaper_path"/*.bmp
    "$wallpaper_path"/*.svg
)
# get array size
wallpapers_size=${#wallpapers[*]}

# set wallpapers in incremental order
index=$(($RANDOM % $wallpapers_size))
while [ $index -lt $wallpapers_size ]
do
    gsettings set org.gnome.desktop.background picture-uri "file:${wallpapers[$index]}"    
    index=$(( $RANDOM % $wallpapers_size ))    
    # keep the wallpaper for the specified time
    sleep 15m
done
