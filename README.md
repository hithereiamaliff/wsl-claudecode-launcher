# WSL Claude Code Launcher

A simple collection of scripts to easily launch [Claude Code](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview) from Windows using WSL (Windows Subsystem for Linux).

## Prerequisites

1. Windows 10/11 with WSL installed and configured
2. [Claude Code](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview) installed in your WSL environment
3. An Anthropic account with Claude Code access

## Installation

1. Clone or download this repository to a location on your Windows machine
2. Open a WSL terminal and ensure Claude Code is installed and working
3. Run `setup.bat` to create shortcuts on your desktop and Start Menu (optional)

## Usage

### Basic Usage

Simply double-click `launch-claude-code.bat` to start Claude Code in your WSL environment. This script will:

1. Enter your WSL environment
2. Source your `.bashrc` file to load environment settings
3. Load NVM if you're using it
4. Launch Claude Code

### Advanced Configuration

For more control, edit the `config.ini` file to customize:

- Working directory where Claude Code will be launched
- Whether to use NVM to find the Claude Code executable
- Custom path to the Claude Code executable (if not using NVM)
- Additional arguments to pass to Claude Code

Then use `advanced-launcher.bat` which will read these settings.

## Available Launchers

- `launch-claude-code.bat` - Standard launcher using NVM
- `launch-claude-code-direct.bat` - Launcher using a direct path to Claude Code executable
- `launch-claude-code.ps1` - PowerShell version of the launcher
- `advanced-launcher.bat` - Configurable launcher that reads settings from `config.ini`

## Creating a Windows Shortcut Manually

You can also create a Windows shortcut manually:

1. Right-click on your desktop and select **New > Shortcut**
2. For the location, enter:
   ```
   C:\Windows\System32\cmd.exe /c "wsl -e bash -c 'source ~/.bashrc && cd /mnt/d/claudecode && export NVM_DIR=\"$HOME/.nvm\" && [ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\" && claude'"
   ```
3. Name the shortcut (e.g., "Claude Code") and click Finish
4. Optionally, right-click the shortcut, select Properties, and change the icon

This creates a direct shortcut that opens WSL, navigates to your project directory (`/mnt/d/claudecode` - change this to your preferred location), and runs the Claude Code command.

## Customization

If the default launchers don't meet your needs, you can easily modify them:

### Finding Your Claude Code Path

In your WSL environment, you can find where Claude Code is installed with:

```bash
which claude
```

The output will be something like:
```
/home/username/.nvm/versions/node/v22.14.0/bin/claude
```

You can use this path in the direct launcher or config.ini.

### Using a Custom Working Directory

To launch Claude Code in a specific directory, either:

1. Edit `config.ini` and set the `WorkingDirectory` value
2. Or modify the launchers to change the `cd` command

## Troubleshooting

### "Command not found" Error

If you get "claude: command not found", ensure:

1. Claude Code is properly installed in your WSL environment
2. Your `.bashrc` file correctly loads NVM if you're using it
3. Try using the direct path launcher with the correct path to your Claude Code executable

### WSL Not Found

If you get an error about WSL not being found:

1. Ensure WSL is installed on your Windows system
2. Run `wsl --list --verbose` to verify your distributions
3. You might need to specify the distribution in the launcher with `-d Ubuntu` (replace Ubuntu with your distro name)

### NVM Not Loading

If NVM isn't loading properly:

1. Check if your NVM setup is in `.bashrc` or `.profile`
2. Modify the launcher to source the correct file
3. Try the direct path launcher instead

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Anthropic](https://www.anthropic.com/) for creating Claude Code
- [Microsoft for Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/)
