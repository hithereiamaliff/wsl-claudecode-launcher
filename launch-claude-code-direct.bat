@echo off
echo Launching Claude Code in WSL with direct path...
REM Replace this path with your actual Claude Code installation path
wsl -e bash -c "cd %~dp0 && /home/username/.nvm/versions/node/vX.Y.Z/bin/claude"
pause