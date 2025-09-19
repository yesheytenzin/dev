#!/bin/bash
set -e

echo "------------------------------------"
echo "   Checking Programming Languages   "
echo "------------------------------------"

# Function to check if a command exists
check_cmd() { command -v "$1" >/dev/null 2>&1; }

# Store results for summary
declare -A installed
declare -A latest

# Python
if check_cmd python3; then
    installed[Python]=$(python3 --version | awk '{print $2}')
    latest[Python]=$(curl -s https://www.python.org/ftp/python/ | grep -oP '[0-9]+\.[0-9]+\.[0-9]+/' | sort -V | tail -1 | tr -d '/')
fi

# Node.js
if check_cmd node; then
    installed[Node.js]=$(node -v)
    latest[Node.js]=$(curl -s https://nodejs.org/dist/index.json | grep -m1 'version' | cut -d '"' -f4)
fi

# Go
if check_cmd go; then
    installed[Go]=$(go version | awk '{print $3}')
    latest[Go]=$(curl -s https://go.dev/dl/ | grep -oP 'go[0-9]+\.[0-9]+(\.[0-9]+)?' | head -1)
fi

# Rust
if check_cmd rustc; then
    installed[Rust]=$(rustc --version | awk '{print $2}')
    latest[Rust]=$(curl -s https://api.github.com/repos/rust-lang/rust/releases/latest | grep tag_name | cut -d '"' -f4)
fi

# Java
if check_cmd java; then
    installed[Java]=$(java -version 2>&1 | head -n 1 | awk '{print $3}' | tr -d '"')
    latest[Java]="Check at jdk.java.net"
fi

# Ruby
if check_cmd ruby; then
    installed[Ruby]=$(ruby -v | awk '{print $2}')
    latest[Ruby]=$(curl -s https://www.ruby-lang.org/en/downloads/ | grep -oP 'The current stable version is \K[0-9]+\.[0-9]+\.[0-9]+')
fi

echo "------------------------------------"
echo "   Check completed"
echo "------------------------------------"

# Print Summary Table
printf "\n%-10s | %-15s | %-15s | %-8s\n" "Language" "Installed" "Latest" "Status"
echo "---------------------------------------------------------------"

for lang in "${!installed[@]}"; do
    inst="${installed[$lang]}"
    new="${latest[$lang]}"
    if [[ "$new" == "Check at jdk.java.net" ]]; then
        status="⚠️  Manual"
    elif [[ "$inst" == "$new" ]]; then
        status="✅ Up-to-date"
    else
        status="⬆️ Update"
    fi
    printf "%-10s | %-15s | %-15s | %-8s\n" "$lang" "$inst" "$new" "$status"
done

