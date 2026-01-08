#!/bin/bash

GO_VERSION="1.25.1"  # Set the desired Go version, change as necessary
DOWNLOAD_URL="https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz"
INSTALL_DIR="/usr/local"

echo "Installing Go version $GO_VERSION..."
curl -L $DOWNLOAD_URL -o /tmp/go$GO_VERSION.linux-amd64.tar.gz
if [ $? -ne 0 ]; then
    echo "Failed to download Go. Please check your network connection."
    exit 1
fi

sudo rm -rf $INSTALL_DIR/go
sudo tar -C $INSTALL_DIR -xzf /tmp/go$GO_VERSION.linux-amd64.tar.gz
rm /tmp/go$GO_VERSION.linux-amd64.tar.gz
echo "export PATH=\$PATH:$INSTALL_DIR/go/bin" >> ~/.bashrc
echo "export PATH=\$PATH:$INSTALL_DIR/go/bin" >> ~/.zshrc  # For zsh users

echo "Go $GO_VERSION has been installed successfully."

