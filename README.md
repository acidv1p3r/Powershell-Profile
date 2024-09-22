
# 🎨 PowerShell Profile (PowerShell Bliss)

A sleek and versatile PowerShell profile designed to deliver an aesthetically pleasing experience that rivals the best of Linux terminals, combining style with powerful functionality.

## ✨ Features Overview

This PowerShell script is designed to enhance your terminal experience by introducing functions, shortcuts, and aesthetic improvements such as:

- **ASCII Art**: Displays a stylized title in white, with magenta separators for enhanced structure.
- **Terminal Enhancements**:
  - `fastfetch`: Displays system information (like neofetch).
  - `oh-my-posh`: Initializes a custom PowerShell prompt using the `clean-detailed` theme.
- **Navigation Shortcuts**: 
  - Quick access to common directories (`docs`, `dtop`, `dload` for Documents, Desktop, Downloads).
- **Directory Management**: 
  - `mkdr`: Combines making a directory and changing to it in one step.
- **Networking Utilities**: 
  - `fdns`: Clears DNS cache.
  - `IP`: Runs `ipconfig` to show network information.
  - `PubIP`: Retrieves the public IP from an external service.
- **System Information**:
  - `sysinfo`: Provides detailed system info via `Get-ComputerInfo`.
  - `uptime`: Displays system uptime (supports PowerShell 5+).
- **Customization of PowerShell Experience**: 
  - Custom color schemes for PSReadLine commands for improved readability.
- **Profile Management**:
  - `ep`: Opens the PowerShell profile for editing.
  - `r-profile`: Reloads the profile to apply changes immediately.
- **Enhanced Directory Listing**:
  - `la`: Lists all files (including hidden) in an auto-sized table.
  - `ls`: Lists only hidden files.

It's a solid setup for improving workflow, providing a clean interface, and ensuring quick access to essential commands and functions!

---

## ⚡ One-Line Install (Elevated PowerShell Recommended)

Execute the following command in an elevated PowerShell window to install the profile:

```powershell
irm "https://github.com/acidv1p3r/powershell-profile/raw/main/setup.ps1" | iex
```

---

## 🛠️ Fix the Missing Font

After running the script, you'll have two options to install a patched font for PowerShell icons:

### Option 1: Manually Install `Caskaydia Cove` Nerd Font
1. Find the downloaded `cove.zip` file in the folder where the script was executed.
2. Extract the `cove.zip`.
3. Locate and install the Nerd fonts.

### Option 2: Install via `oh-my-posh`
1. Run the command: `oh-my-posh font install`.
2. Select from the Nerd Fonts list using arrow keys, then press `ENTER`.
3. Done!

---

## 🎨 Customize the Profile

After installation, run `Edit-Profile` to create a user-specific `profile.ps1`. You can then tweak and customize it to suit your preferences.

Enjoy your enhanced and stylish PowerShell experience! 🚀
