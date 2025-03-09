Write-Host "Launching Claude Code in WSL..."
wsl bash -c "source ~/.bashrc && cd '$PSScriptRoot' && export NVM_DIR='`$HOME/.nvm' && [ -s '`$NVM_DIR/nvm.sh' ] && \. '`$NVM_DIR/nvm.sh' && claude"
Read-Host -Prompt "Press Enter to exit"