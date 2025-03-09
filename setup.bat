@echo off
echo Creating Claude Code shortcut on Desktop...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%USERPROFILE%\Desktop\Claude Code.lnk'); $s.TargetPath = '%~dp0launch-claude-code.bat'; $s.WorkingDirectory = '%~dp0'; $s.Save()"

echo Creating Claude Code shortcut in Start Menu...
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Claude Code" mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Claude Code"
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\Claude Code\Claude Code.lnk'); $s.TargetPath = '%~dp0launch-claude-code.bat'; $s.WorkingDirectory = '%~dp0'; $s.Save()"

echo Done!
echo Shortcuts created on Desktop and in Start Menu.
pause