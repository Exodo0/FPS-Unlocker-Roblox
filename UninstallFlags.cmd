@echo off

REM Buscar la ruta de instalación actual de Roblox
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
if exist "%folder%\ClientSettings\ClientAppSettings.json" (
    del "%folder%\ClientSettings\ClientAppSettings.json"
)

echo.
echo ===================================================

echo Thanks for using Flags!

echo ===================================================
echo.
echo Press any key to continue... & pause >nul
