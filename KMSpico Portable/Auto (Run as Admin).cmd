@echo off
pushd "%~dp0"
echo Please wait...
REM Disable SmartScreen
regedit /S DisableSmartScreen.reg
REM Activate
AutoPico.exe
REM Create Task for AutoReactivation
set directorio=%~dp0
set name="AutoPico Daily Restart"
SCHTASKS /Create /TN %name% /TR "%directorio%AutoPico.exe /silent" /SC DAILY /ST 23:59:59 /RU SYSTEM /RL Highest /F
popd
exit



