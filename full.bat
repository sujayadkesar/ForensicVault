@echo off

:: Get the drive letter of the script's location
for %%x in ("%~dp0") do set "drive=%%~dx"

:: Create the Evidence folder
set "evidenceFolder=%drive%\Evidence"
mkdir "%evidenceFolder%"

:: Set the backup command
set "backupcmd=xcopy /s /c /d /e /h /i /r /y"

echo off

@REM Collect  System Logsssssssssssssss
%backupcmd% "%SystemRoot%\System32\winevt\Logs" "%evidenceFolder%\SystemLogs"

@REM Copy all Registry Files
%backupcmd% "%SystemRoot%\System32\config" "%evidenceFolder%\RegistryFiles"

@REM User Profile
%backupcmd% "%USERPROFILE%\Desktop" "%evidenceFolder%\Desktop"
%backupcmd% "%USERPROFILE%\Documents" "%evidenceFolder%\Documents"
%backupcmd% "%USERPROFILE%\Pictures" "%evidenceFolder%\Pictures"
%backupcmd% "%USERPROFILE%\Downloads" "%evidenceFolder%\Downloads"

@REM Copy Browsing Data
%backupcmd% "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache" "%evidenceFolder%\BrowserData\Internet Explorer"
%backupcmd% "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default" "%evidenceFolder%\BrowserData\Google Chrome"
%backupcmd% "%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles" "%evidenceFolder%\BrowserData\Mozilla Firefox"

@REM Recent Files
%backupcmd% "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent" "%evidenceFolder%\RecentFiles"

@echo off
cls
