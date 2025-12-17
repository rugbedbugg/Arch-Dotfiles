# Arch Dotfiles Manual
Personal Arch Linux configuration files, maintained as a **manual setup** rather than an automated installer. This repository is meant to be *read, understood, and selectively applied* — not blindly installed.

## Philosophy
These dotfiles are desgined to be **manually integrated** into your setup:
* No install script
* No one-command magic
* You decide what to use and how

This keeps things transparent, debuggable, and adaptable to different machines.

## What This Repo Is
A collection of configuration files for my daily Arch Linux environment, focused on:
* A clean Hyprland workflow
* Minimally riced visuals
* Essentials-only tooling  

Primary components include window management, terminal, editor, shell, and UI utilities.

## Repository Structure
```
Arch-Dotfiles/
├── hypr/        # Hyprland compositor config
├── kitty/       # Kitty terminal config
├── nvim/        # Neovim (Lazy-based) config
├── waybar/      # Waybar status bar
├── rofi/        # Rofi launcher and menus
├── shell/       # Shell configs, aliases, prompts
├── wal/         # Pywal color integration
└── fastfetch/   # System info display
```
Not every directory is required. Pick what you need.

## Prerequisites
This setup assumes:
* **Arch Linux** (or Arch-based)
* A `Hyprland-uswm managed` session
* Basic familiarity with:
  * `~/.config`
  * symlinks
  * reading config files

## Manual Installation Guide
### 1. Clone the Repository
```sh
git clone https://github.com/rugbedbugg/Arch-Dotfiles.git
cd Arch-Dotfiles
```
### 2. Inspect Before Using
Before linking anything:
```sh
less hypr/hyprland.conf
less nvim/init.lua
```
Assume **nothing** is safe for your system until you read it.
### 3. Link Configs Selectively
Use symlinks instead of copying.
Example:
```sh
ln -s $PWD/kitty ~/.config/kitty
ln -s $PWD/hypr ~/.config/hypr
```
Do this **one component at a time** to avoid breaking your setup beyond repair.
### 4. Test Incrementally
After linking:
* Restart the relevant application
* Fix errors immediately
* Only then move to the next config
If something breaks, remove the symlink:
```sh
rm ~/.config/kitty
```

## Component Notes
### Hyprland
* All except custom-added Keybindings are opinionated
* Monitor layout is hardware-specific
* You *will* need to adjust resolution and output names
### Neovim
* Lazy.nvim-based
* Treesitter and Lualine plugins included
* Does not include LSPs
If something fails, start with:
```sh
nvim --clean
```
Then reintroduce configs gradually.
### Shell
* Aliases and prompt tweaks
* Some aliases (Local AI agents) may not work. Remove/Comment them out
* Dynamic (pywal-compatible)
Source carefully if merging with an existing `.bashrc` or `.zshrc`.

## Updating
Pull changes manually:
```sh
git pull
```
Resolve conflicts consciously. These are *configs*, not libraries.

## Warnings
⚠️ These dotfiles:
* Assume Arch defaults
* Assume certain packages exist
* May break without notice

They are **not beginner-proof**.

## Final Note
If you are looking for a one-command setup — this repo is not for you.

If you want control, understanding, and ownership — welcome.
