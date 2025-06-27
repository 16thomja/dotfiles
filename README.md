Make sure curl is installed

`/lb` means chezmoi gets installed in `~/.local/bin`

Edit `chezmoi.toml` with machine-specific configs after copying and before applying

```
cd
sh -c "$(curl -fsLS get.chezmoi.io/lb)"
export PATH="$HOME/.local/bin:$PATH"
chezmoi init https://github.com/16thomja/dotfiles.git
mkdir -p ~/.config/chezmoi
cp ~/.local/share/chezmoi/example-chezmoi.toml ~/.config/chezmoi/chezmoi.toml
chezmoi apply
```
