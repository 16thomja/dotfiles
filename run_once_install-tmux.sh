#!/bin/bash

# Install tmux if not already installed
if ! command -v tmux &> /dev/null; then
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt update && sudo apt install -y tmux
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y tmux
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -S --noconfirm tmux
    else
        echo "Unsupported package manager. Please install tmux manually."
        exit 1
    fi
fi

# Install TPM (Tmux Plugin Manager) if not already installed
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "tmux installation and setup complete."
