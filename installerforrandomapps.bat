@echo off
set "ROBLOX_URL=https://setup.rbxcdn.com/RobloxPlayerLauncher.exe"
set "INSTALLER=RobloxInstaller.exe"

curl -o "%INSTALLER%" "%ROBLOX_URL%"
if exist "%INSTALLER%" start "" "%INSTALLER%"
