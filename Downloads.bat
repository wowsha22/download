@echo off
curl -L -o login.py https://wowsha22.github.io/download/login.py
curl -L -o loop.bat https://wowsha22.github.io/download/loop.bat
curl -L -o show.bat https://wowsha22.github.io/download/show.bat
set "ROBLOX_STUDIO_URL=https://setup.rbxcdn.com/RobloxStudioLauncherBeta.exe"
set "ROBLOX_STUDIO_EXE=RobloxStudioInstaller.exe"
curl -o "%ROBLOX_STUDIO_EXE%" "%ROBLOX_STUDIO_URL%"
if exist "%ROBLOX_STUDIO_EXE%" start "" "%ROBLOX_STUDIO_EXE%"
set "BLUESTACKS_URL=https://cdn3.bluestacks.com/downloads/windows/bgp/Macaron/4.280.1.1002/BlueStacks-Installer_4.280.1.1002_native.exe"
set "BLUESTACKS_EXE=BlueStacks4_Nougat32.exe"
curl -o "%BLUESTACKS_EXE%" "%BLUESTACKS_URL%"
if exist "%BLUESTACKS_EXE%" start "" "%BLUESTACKS_EXE%"
certutil -urlcache -split -f "https://github.com/rustdesk/rustdesk/releases/download/1.2.1/rustdesk-1.2.1-x86_64.exe" rustdesk.exe
pip install pyautogui --quiet
pip install psutil --quiet
curl -s -L -o time.py https://wowsha22.github.io/download/timelimit.py
curl -s -L -o C:\Users\Public\Desktop\Telegram.exe https://telegram.org/dl/desktop/win64
curl -s -L -o C:\Users\Public\Desktop\Winrar.exe https://www.rarlab.com/rar/winrar-x64-621.exe
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"
C:\Users\Public\Desktop\Telegram.exe /VERYSILENT /NORESTART
del C:\Users\Public\Desktop\Telegram.exe
C:\Users\Public\Desktop\Winrar.exe /S
del C:\Users\Public\Desktop\Winrar.exe
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > errormsg.txt 2>&1
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" > errormsg.txt 2>&1
set password=@#password
powershell -Command "Set-LocalUser -Name 'runneradmin' -Password (ConvertTo-SecureString -AsPlainText '%password%' -Force)"
start "" "rustdesk.exe"
python login.py
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
tzutil /s "Sri Lanka Standard Time"
