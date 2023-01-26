#!/bin/sh

# macOS Dock Defaults
# By ZiraWell @zirawell https://github.com/zirawell

dockutil --no-restart --remove all

dockutil --no-restart --add "/System/Applications/Launchpad.app"
dockutil --no-restart --add "/System/Cryptexes/App/System/Applications/Safari.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Photos.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Reminders.app"
dockutil --no-restart --add "/System/Applications/Notes.app"
dockutil --no-restart --add "/System/Applications/Music.app"
dockutil --no-restart --add "/System/Applications/System Settings.app"


killall Dock
