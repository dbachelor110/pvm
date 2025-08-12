#!/usr/bin/env bash
set -e

PVM_DIR="${HOME}/.pvm"

echo "[pvm] Installing Podman Version Manager for PHP..."

# 1. 建立資料夾
mkdir -p "$PVM_DIR/bin" "$PVM_DIR/versions"

# 2. 下載 pvm 主腳本
echo "[pvm] Downloading pvm script..."
curl -fsSL "https://raw.githubusercontent.com/YOUR_GITHUB_REPO/main/pvm" -o "$PVM_DIR/pvm"
chmod +x "$PVM_DIR/pvm"

# 3. 設定 PATH 與 hook
SHELL_RC=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

if ! grep -q 'export PATH="$HOME/.pvm:$PATH"' "$SHELL_RC"; then
    echo 'export PATH="$HOME/.pvm:$PATH"' >> "$SHELL_RC"
    echo '[pvm] Added pvm to PATH.'
fi

if ! grep -q 'pvm auto' "$SHELL_RC"; then
    cat <<'EOF' >> "$SHELL_RC"

# pvm auto-switch
if command -v pvm >/dev/null; then
    if [ -n "$ZSH_VERSION" ]; then
        autoload -U add-zsh-hook
        pvm_auto_hook() { pvm auto; }
        add-zsh-hook chpwd pvm_auto_hook
        pvm auto
    else
        cd() {
            builtin cd "$@" || return
            pvm auto
        }
        pvm auto
    fi
fi
EOF
    echo '[pvm] Added auto-switch hook.'
fi

echo "[pvm] Installation complete!"
echo "Restart your shell or run: source $SHELL_RC"
echo "Run 'pvm help' to get started."
