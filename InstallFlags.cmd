@echo off

echo.
echo ===================================================
echo Flags was created and is maintained by Egologic.
echo (C) Egologic 2022 - Present, All Rights Reserved.
echo ===================================================
echo.

echo.
echo Starting Flags installation...
echo.

REM Pedir confirmación al usuario
choice /M "Do you want to update Flags every time you start your computer?"

IF ERRORLEVEL 2 GOTO SkipUpdate

REM Obtener la ruta de instalación actual de Flags
for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set "folder=%%i"
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set "folder=%%i"
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set "folder=%%i"
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

cls

echo Downloading and installing Flags Auto-Updater...
powershell.exe -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Exodo0/Unlocker-Roblox/main/AutoUpdater.cmd' -OutFile '%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Flags-AutoUpdater.bat'"
if %errorlevel% EQU 0 (
    echo Flags Auto-Updater downloaded and installed successfully!
) else (
    echo Failed to download Flags Auto-Updater.
)

echo.

echo Downloading ClientAppSettings.json file...
echo.

powershell.exe -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Exodo0/Unlocker-Roblox/main/ClientAppSettings.json' -OutFile '%folder%\ClientSettings\ClientAppSettings.json'"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo SUCCESS: Flags installation completed!
) else (
    echo Failed to download ClientAppSettings.json.
    echo.
    echo ERROR: Flags installation failed!
)
echo.
echo NOTE:
echo.
echo 1. Run this script every time there is an update when Roblox updates!
echo.
echo 2. To uninstall Flags at any time, run Flags-Uninstaller.cmd!
echo.
echo Press any key to continue... & pause >nul
goto :EOF

:SkipUpdate
echo.
echo Flags installation skipped. You can manually run the script to update.
echo.
echo NOTE:
echo.
echo 1. Run this script every time there is an update when Roblox updates!
echo.
echo 2. To uninstall Flags at any time, run UninstallFlags.cmd!
echo.
echo Press any key to continue... & pause >nul
