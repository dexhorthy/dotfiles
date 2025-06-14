#!/usr/bin/env zsh


cd ~/go/src/github.com

target=$(find . -mindepth 2 -maxdepth 2 -type d | sed 's|^\./|github.com/|' | grep -v '^github.com/\.' | dmenu-mac -p "URL")


open "https://$target"

