#!/bin/bash

# Directory where ghp script and its configuration will be installed
GHP_INSTALL_DIR="$HOME/.ghp"
GHP_BIN_DIR="$GHP_INSTALL_DIR/bin"
GHP_SCRIPT_URL="https://raw.githubusercontent.com/czibulapetertamas/ghp/main/ghp"
ALIAS_FILE="$GHP_INSTALL_DIR/aliases"

# Create directories if they don't exist
mkdir -p "$GHP_BIN_DIR"

# Download ghp script
curl -o "$GHP_BIN_DIR/ghp" "$GHP_SCRIPT_URL"
chmod +x "$GHP_BIN_DIR/ghp"

# Add bin directory to PATH if not already present
if [[ ":$PATH:" != *":$GHP_BIN_DIR:"* ]]; then
  echo "export PATH=\"$GHP_BIN_DIR:\$PATH\"" >> "$HOME/.bashrc"
  echo "export PATH=\"$GHP_BIN_DIR:\$PATH\"" >> "$HOME/.zshrc"
  export PATH="$GHP_BIN_DIR:$PATH"
fi

# Check if the aliases file exists
if [ ! -f "$ALIAS_FILE" ]; then
  echo "Creating aliases file..."
  touch "$ALIAS_FILE"
  echo "# PHP Aliases" > "$ALIAS_FILE"
fi

# Ensure aliases file is sourced in shell configuration
if ! grep -q "source $ALIAS_FILE" "$HOME/.bashrc"; then
  echo "source $ALIAS_FILE" >> "$HOME/.bashrc"
fi

if ! grep -q "source $ALIAS_FILE" "$HOME/.zshrc"; then
  echo "source $ALIAS_FILE" >> "$HOME/.zshrc"
fi

# Inform user to restart the shell
echo "ghp installed successfully. Restart your terminal or run 'source ~/.bashrc' or 'source ~/.zshrc' to update your PATH and load the aliases."
