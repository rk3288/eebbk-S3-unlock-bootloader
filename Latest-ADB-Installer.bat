@echo off

echo Please wait installation in progress
:: Source: https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
:: Source: https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights
:: batch code to request admin previleges, if no admin previleges
net session >nul 2>&1
if NOT %errorLevel% == 0 (
powershell -executionpolicy bypass start -verb runas '%0' am_admin & exit /b
)

:: Source: https://stackoverflow.com/questions/672693/windows-batch-file-starting-directory-when-run-as-admin
:: Going back to script directory
cd %~dp0

:: Downloading latest adb installer batch file
PowerShell -executionpolicy bypass -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.jsdelivr.net/gh/fawazahmed0/Latest-adb-fastboot-installer-for-windows@master/Latest-ADB-Installerbat', 'adbinstaller.bat')"

:: Clear screen
cls

:: Executing the batch
call adbinstaller.bat

:: Deleting the bat file
del /f adbinstaller.bat > nul 2>&1
