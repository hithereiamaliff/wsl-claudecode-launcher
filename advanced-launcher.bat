@echo off
setlocal enabledelayedexpansion

REM Load configuration from config.ini
set UseNVM=true
set WorkingDirectory=
set CustomPath=
set AdditionalArguments=

for /f "tokens=1,2 delims==" %%a in (config.ini) do (
    set line=%%a
    if "!line:~0,1!" neq "#" (
        set field=!line: =!
        if "!field!" == "UseNVM" set UseNVM=%%b
        if "!field!" == "WorkingDirectory" set WorkingDirectory=%%b
        if "!field!" == "CustomPath" set CustomPath=%%b
        if "!field!" == "AdditionalArguments" set AdditionalArguments=%%b
    )
)

REM Remove spaces
set UseNVM=!UseNVM: =!
set WorkingDirectory=!WorkingDirectory: =!
set CustomPath=!CustomPath: =!

REM Prepare working directory
set cdCommand=cd %~dp0
if not "!WorkingDirectory!" == "" set cdCommand=cd !WorkingDirectory!

REM Prepare launcher command
if /i "!UseNVM!" == "true" (
    echo Launching Claude Code with NVM...
    wsl -e bash -c "source ~/.bashrc && !cdCommand! && export NVM_DIR=\"$HOME/.nvm\" && [ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\" && claude !AdditionalArguments!"
) else (
    if "!CustomPath!" == "" (
        echo Error: When UseNVM is set to false, CustomPath must be specified in config.ini
        pause
        exit /b 1
    ) else (
        echo Launching Claude Code with direct path...
        wsl -e bash -c "!cdCommand! && !CustomPath! !AdditionalArguments!"
    )
)

pause