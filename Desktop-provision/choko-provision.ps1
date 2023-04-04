function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function Install-Programs {
    param (
        [string] $programsFile
    )

    $programs = Get-Content $programsFile | Where-Object { $_ -notmatch '^#' }
    foreach ($program in $programs) {
        choco install $program -y
    }
}

function Move-WindowsTerminalConfig {
    param (
        [string] $configPath
    )

    $terminalConfigPath = Join-Path $env:LOCALAPPDATA "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
    if (-not (Test-Path $terminalConfigPath)) {
        New-Item -ItemType Directory -Path $terminalConfigPath
    }
    Move-Item $configPath (Join-Path $terminalConfigPath "settings.json")
}

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell -Verb runAs -ArgumentList ('-NoProfile -ExecutionPolicy Bypass -File "{0}"' -f ($myinvocation.MyCommand.Definition))
    exit
}

try {
    $programsFile = "programs.txt"
    $configPath = "windows_terminal_settings.json"
    Install-Chocolatey
    Install-Programs -programsFile $programsFile
    if (Test-Path $configPath) {
        Move-WindowsTerminalConfig -configPath $configPath
    }
    Write-Host "Installation complete!"
} catch {
    Write-Error "An error occurred during installation: $_"
    exit 1
}
