@echo off

:: Get the drive letter of the script's location
for %%x in ("%~dp0") do set "drive=%%~dx"

:: Create the Evidence folder if it doesn't exist
set "evidenceFolder=%drive%Evidence"
if not exist "%evidenceFolder%" mkdir "%evidenceFolder%"

:: Set the backup command
set "backupcmd=xcopy /s /c /d /e /h /i /r /y"

:: Define source and destination paths
set "systemLogs=%SystemRoot%\System32\winevt\Logs"
set "registryFiles=%SystemRoot%\System32\config"
set "userProfile=%USERPROFILE%"
set "internetCache=%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache"
set "chromeData=%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default"
set "firefoxData=%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles"
set "recentFiles=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent"

:: Perform the backups
%backupcmd% "%systemLogs%" "%evidenceFolder%\SystemLogs"
%backupcmd% "%registryFiles%" "%evidenceFolder%\RegistryFiles"
%backupcmd% "%userProfile%\Desktop" "%evidenceFolder%\UserProfile\Desktop"
%backupcmd% "%userProfile%\Documents" "%evidenceFolder%\UserProfile\Documents"
%backupcmd% "%userProfile%\Pictures" "%evidenceFolder%\UserProfile\Pictures"
%backupcmd% "%userProfile%\Downloads" "%evidenceFolder%\UserProfile\Downloads"
%backupcmd% "%internetCache%" "%evidenceFolder%\BrowserData\Internet Explorer"
%backupcmd% "%chromeData%" "%evidenceFolder%\BrowserData\Google Chrome"
%backupcmd% "%firefoxData%" "%evidenceFolder%\BrowserData\Mozilla Firefox"
%backupcmd% "%recentFiles%" "%evidenceFolder%\RecentFiles"

cls
echo Backup completed successfully.
