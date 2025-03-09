@echo off
echo Launching Claude Code in WSL...
wsl -e bash -c "source ~/.bashrc && cd %~dp0 && export NVM_DIR=\"$HOME/.nvm\" && [ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\" && claude"
pause