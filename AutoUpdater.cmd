@echo off

echo.
echo Flags Auto-Updater
echo.

REM Verificar si existe la carpeta de instalación de Flags
if not exist "%localappdata%\Roblox\Versions\*" (
    echo Flags is not installed. Run the Flags installation script first.
    echo.
    echo Press any key to continue... & pause >nul
    exit /b
)

REM Obtener la ruta de instalación actual de Flags
for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set "folder=%%i"
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading ClientAppSettings.json file...
powershell.exe -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Exodo0/Unlocker-Roblox/main/ClientAppSettings.json' -OutFile '%folder%\ClientSettings\ClientAppSettings.json'"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo Flags Auto-Update: Update completed!
) else (
    echo Failed to download ClientAppSettings.json.
    echo.
    echo Flags Auto-Update: Update failed!
)
echo. ClientSettings Updated....
echo.
echo Press any key to continue... & pause >nul
