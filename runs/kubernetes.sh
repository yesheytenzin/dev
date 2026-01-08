#!/bin/bash

# Inform the user about what's happening
echo "Installing Kubernetes CLI (kubectl)..."

# Download the latest stable version of kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Move kubectl to /usr/local/bin (standard location for binaries)
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Make kubectl executable
chmod +x kubectl

# Move kubectl to ~/.local/bin
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

# Check if ~/.local/bin is in the PATH in .zshrc
if ! grep -q "export PATH=\"\$HOME/.local/bin" ~/.zshrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    echo "Added ~/.local/bin to your PATH in ~/.zshrc"
else
    echo "~/.local/bin is already in your PATH in ~/.zshrc"
fi

# Source .zshrc to apply changes immediately
source ~/.zshrc

# Verify kubectl installation
kubectl version --client

echo "install minicube"
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

