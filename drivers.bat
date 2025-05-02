@echo off
setlocal enabledelayedexpansion

:: Admin check
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Please run this script as Administrator.
    pause
    exit /b
)

:: Set working folders
set "BASE_DIR=%~dp0"
set "DRIVERS_DIR=%BASE_DIR%Drivers"
set "SDIO_URL=https://download.snappy-driver-installer.org/upd/sdio_origin.7z"
set "SDIO_7Z=%BASE_DIR%sdio_origin.7z"
set "SDIO_EXTRACTED=%BASE_DIR%SDIO"

:: Step 1: Create Drivers folder if missing
if not exist "%DRIVERS_DIR%" (
    echo [+] Creating driver folder: Drivers
    mkdir "%DRIVERS_DIR%"
)

:: Step 2: Download SDIO Origin if missing
if not exist "%SDIO_7Z%" (
    echo [+] Downloading Snappy Driver Installer Origin (SDIO)...
    powershell -Command "Invoke-WebRequest -Uri '%SDIO_URL%' -OutFile '%SDIO_7Z%'"
) else (
    echo [=] SDIO archive already exists.
)

:: Step 3: Extract it
if not exist "%SDIO_EXTRACTED%" (
    echo [+] Extracting SDIO...
    powershell -Command "Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%SDIO_7Z%', '%SDIO_EXTRACTED%')" 2>nul
    if %errorlevel% neq 0 (
        echo [!] Extraction failed. Make sure 7-Zip or .NET is installed. You can also extract manually.
        pause
        exit /b
    )
) else (
    echo [=] SDIO already extracted.
)

:: Step 4: Run SDIO in automated mode to install all drivers silently
echo [+] Running SDIO in silent install mode...
pushd "%SDIO_EXTRACTED%"
start "" /wait SDIO.exe /autoinstall
popd

:: Step 5: Post-install driver folder scan (optional)
echo [+] Optionally installing additional .INF drivers from Drivers\

for /r "%DRIVERS_DIR%" %%F in (*.inf) do (
    echo Installing: %%~nxF
    pnputil /add-driver "%%F" /install >nul
)

echo.
echo [✓] Driver installation complete.
pause
