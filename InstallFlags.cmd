@echo off
setlocal EnableDelayedExpansion

echo ===================================================
echo Flags was created and is maintained by Egologic.
echo (C) Egologic 2023 - Present, All Rights Reserved.
echo Starting Flags installation...
echo ===================================================

REM User confirmation

choice /M "Do you want to install Flags?"
if errorlevel 2 (
    echo Installation cancelled by user.
    pause
    exit /b
)

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)
cls

echo ===================================================
echo Downloading ClientAppSettings.json file...
echo ===================================================

set "jsonURL=https://raw.githubusercontent.com/Exodo0/Unlocker-Roblox/main/ClientAppSettings.json"
powershell.exe -Command "Invoke-WebRequest -Uri '%jsonURL%' -OutFile '%folder%\ClientSettings\ClientAppSettings.json'"

if !errorLevel! EQU 0 (
    cls
    echo ===================================================
    echo Flags installation completed!
    echo ===================================================
) else (
    echo ===================================================
    echo Flags installation failed!
    echo ===================================================
)

echo NOTE:

echo 1. Run this script every time there is an update when Roblox updates!

echo 2. If you want to uninstall Flags, run UninstallFlags.cmd

echo ===================================================

echo Press any key to continue... & pause >nul
