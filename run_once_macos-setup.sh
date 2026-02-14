#!/bin/bash

# ───────────────────────────────────────────────
# Finder
# ───────────────────────────────────────────────
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true

# ───────────────────────────────────────────────
# Dock
# ───────────────────────────────────────────────
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock launchanim -bool false

# ───────────────────────────────────────────────
# Menu Bar: nascondi la barra nativa (per SketchyBar)
# ───────────────────────────────────────────────
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# ───────────────────────────────────────────────
# Mission Control / Spaces (per AeroSpace)
# ───────────────────────────────────────────────
# Non riordinare automaticamente gli Spaces
defaults write com.apple.dock mru-spaces -bool false
# Raggruppa finestre per app in Mission Control
defaults write com.apple.dock expose-group-apps -bool true

# ───────────────────────────────────────────────
# Animazioni: disabilita per reattivita tiling
# ───────────────────────────────────────────────
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# ───────────────────────────────────────────────
# Tastiera: velocita massima di ripetizione
# ───────────────────────────────────────────────
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# ───────────────────────────────────────────────
# Applica modifiche
# ───────────────────────────────────────────────
killall Finder
killall Dock
