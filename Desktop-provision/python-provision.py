import os
import sys
import shutil
import subprocess
from pathlib import Path

def install_chocolatey():
    subprocess.run(['powershell', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-Command', 'iex ((New-Object System.Net.WebClient).DownloadString(\'https://chocolatey.org/install.ps1\'))'])

def install_homebrew():
    subprocess.run(['/bin/bash', '-c', "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"])

def install_programs_windows(programs):
    for program in programs:
        subprocess.run(['choco', 'install', program, '-y'])

def install_programs_macos(programs):
    for program in programs:
        subprocess.run(['brew', 'install', '--cask', program])

def move_windows_terminal_config(config_path):
    terminal_config_path = Path(os.environ['LOCALAPPDATA'], 'Packages', 'Microsoft.WindowsTerminal_8wekyb3d8bbwe', 'LocalState')
    terminal_config_path.mkdir(parents=True, exist_ok=True)
    shutil.move(config_path, terminal_config_path / 'settings.json')

def read_programs(programs_file):
    with open(programs_file) as f:
        return [line.strip() for line in f if not line.startswith('#')]

def main():
    if sys.platform.startswith('win'):
        install_chocolatey()
        programs = read_programs('programs.txt')
        programs.extend(["git", "microsoft-windows-terminal"])
        install_programs_windows(programs)

        config_path = 'windows_terminal_settings.json'
        if os.path.exists(config_path):
            move_windows_terminal_config(config_path)
    elif sys.platform.startswith('darwin'):
        install_homebrew()
        programs = read_programs('programs.txt')
        install_programs_macos(programs)
    else:
        print("This script only supports Windows and macOS.")
        sys.exit(1)

    print("Installation complete!")

if __name__ == '__main__':
    main()
