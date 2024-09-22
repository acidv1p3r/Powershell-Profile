### PowerShell Profile Refactor
### Version 1.03 - Refactored

#################################################################################################################################
############                                                                                                         ############
############                                          !!!   WARNING:   !!!                                           ############
############                                                                                                         ############
############                DO NOT MODIFY THIS FILE. THIS FILE IS HASHED AND UPDATED AUTOMATICALLY.                  ############
############                    ANY CHANGES MADE TO THIS FILE WILL BE OVERWRITTEN BY COMMITS TO                      ############
############                       https://github.com/ChrisTitusTech/powershell-profile.git.                         ############
############                                                                                                         ############
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
############                                                                                                         ############
############                      IF YOU WANT TO MAKE CHANGES, USE THE Edit-Profile FUNCTION                         ############
############                              AND SAVE YOUR CHANGES IN THE FILE CREATED.                                 ############
############                                                                                                         ############
#################################################################################################################################

#opt-out of telemetry before doing anything, only if PowerShell is run as admin
# ASCII Art Header
$asciiArt = @"
  _____                       _____ _          _ _ 
 |  __ \                     / ____| |        | | |
 | |__) |____      _____ _ __ (___ | |__   ___| | |
 |  ___/ _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | |
 | |  | (_) \ V  V /  __/ |  ____) | | | |  __/ | |
 |_|   \___/ \_/\_/ \___|_| |_____/|_| |_|\___|_|_|
                                                  
"@

# Display ASCII art and separators
Write-Host $asciiArt -ForegroundColor White
Write-Host ("-" * 100) -ForegroundColor Magenta
Write-Host "`n"

# Run fastfetch for system information
fastfetch

# Separator
Write-Host ("-" * 100) -ForegroundColor Magenta

# Initialize Oh My Posh with the clean-detailed theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/clean-detailed.omp.json" | Invoke-Expression

# Navigation Shortcuts
function docs { Set-Location -Path $HOME\Documents }
function dtop { Set-Location -Path $HOME\Desktop }
function dload { Set-Location -Path $HOME\Downloads }

# Directory Management
function mkdr { 
    param($dir) 
    mkdir $dir -Force
    Set-Location $dir 
}

# Networking Utilities
function fdns { 
    Clear-DnsClientCache
    Write-Host "DNS has been flushed"
}

function IP { ipconfig }
function c { clear }

function PubIP {
    $publicIP = (Invoke-WebRequest -Uri "http://ifconfig.me/ip").Content
    Write-Host "Your public IP address is: $publicIP"
}

# Alias for nslookup
Set-Alias nslookup Resolve-DnsName

# Quick Access to System Information
function sysinfo { Get-ComputerInfo }

# System Uptime (More Readable Format)
function uptime {
    $uptime = (Get-Date) - (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
    Write-Host "Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes"
}

# Show Disk Usage (Used, Free, and Total)
function du {
    Get-PSDrive -PSProvider FileSystem | 
    Select-Object Name, 
        @{Name='Used(GB)'; Expression={[math]::round($_.Used/1GB, 2)}}, 
        @{Name='Free(GB)'; Expression={[math]::round($_.Free/1GB, 2)}}, 
        @{Name='Total(GB)'; Expression={[math]::round($_.Used/1GB + $_.Free/1GB, 2)}} | 
    Format-Table -AutoSize
}

# Get Top 10 Processes by CPU Usage
function procinfo { 
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 
}

# Enhanced PowerShell Experience
Set-PSReadLineOption -Colors @{
    Command = 'Yellow'
    Parameter = 'Green'
    String = 'DarkCyan'
}

# Quick Access to Editing the Profile
function ep { notepad.exe $PROFILE }

# Reload the Profile
function r-profile { & $PROFILE }

# Enhanced Directory Listing
function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }
function ls { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }
