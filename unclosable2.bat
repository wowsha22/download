@echo off
setlocal enabledelayedexpansion

set "EXE_NAME=rustdesk.exe"
set "EXE_PATH="

:: Find path of currently running process
for /f "tokens=*" %%i in ('wmic process where "name='%EXE_NAME%'" get ExecutablePath ^| findstr /i ".exe"') do (
    set "EXE_PATH=%%i"
)

if not defined EXE_PATH (
    echo %EXE_NAME% is not running and path could not be found.
    exit /b
)

:loop
:: Check if the process is running
tasklist | find /i "%EXE_NAME%" >nul
if errorlevel 1 (
    start "" "%EXE_PATH%"
)

timeout /t 5 >nul
goto loop
