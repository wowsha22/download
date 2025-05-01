@echo off
set "EXE_NAME=rustdesk.exe"
set "EXE_PATH="

for /f "tokens=*" %%i in ('wmic process where "name='%EXE_NAME%'" get ExecutablePath ^| findstr /i ".exe"') do (
    set "EXE_PATH=%%i"
)

if not defined EXE_PATH (
    echo %EXE_NAME% is not running.
)
