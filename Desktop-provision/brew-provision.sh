#!/bin/bash

set -e

function install_homebrew {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install_programs {
    local programs_file="$1"
    while IFS= read -r line; do
        if [[ ! "$line" =~ ^# ]]; then
            brew install --cask "$line"
        fi
    done < "$programs_file"
}

{
    programs_file="programs.txt"
    install_homebrew
    install_programs "$programs_file"
    echo "Installation complete!"
} || {
    echo "An error occurred during installation."
    exit 1
}
