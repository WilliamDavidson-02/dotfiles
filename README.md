# William's dotfiles

> [!WARNING]
> Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Contents

- vim (neovim) config
- git config
- fish config
- ghostty config

## Git config setup

Include the path to the git config file from your root `.gitconfig` or remote the root config to allow the `git/config`

```bash
[include]
    path = ~/.config/git/config
```

## Shell setup (macOS & Linux)

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager

After installing fish and fisher install fish plugins

```bash
fisher update
```
