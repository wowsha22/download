@echo off
setlocal
set "bluestacks_url=https://archive.org/download/bluestacks_202404/Bluestack%204%20x64/BlueStacks-Installer_4.280.4.4002_amd64_native.exe"
set "bluestacks_filename=BlueStacks-Installer_4.280.4.4002_amd64_native.exe"
set "unityhub_url=https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe"
set "unityhub_filename=UnityHubSetup.exe"
set "bluestacks_temp=%cd%\%bluestacks_filename%"
set "unityhub_temp=%cd%\%unityhub_filename%"
set "desktop=%USERPROFILE%\Desktop"
powershell -Command "Invoke-WebRequest -Uri '%bluestacks_url%' -OutFile '%bluestacks_temp%'"
echo Downloading Unity Hub installer...
powershell -Command "Invoke-WebRequest -Uri '%unityhub_url%' -OutFile '%unityhub_temp%'"
move /Y "%bluestacks_temp%" "%desktop%\%bluestacks_filename%"
move /Y "%unityhub_temp%" "%desktop%\%unityhub_filename%"
echo All downloads completed and moved to Desktop.
pause
