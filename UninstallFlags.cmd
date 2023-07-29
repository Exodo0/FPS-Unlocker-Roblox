@echo off

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

REM Eliminar el auto-actualizador de shell:startup
if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Flags-AutoUpdater.bat" (
    del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Flags-AutoUpdater.bat"
)

:NextStep
if exist "%folder%\ClientSettings\ClientAppSettings.json" (
    del "%folder%\ClientSettings\ClientAppSettings.json"
)

echo.
echo.
echo THANK YOU FOR USING Flags!
echo.
echo.
echo Press any key to continue... & pause >nul
