Make sure curl is installed

/lb means chezmoi gets installed in .local/bin

```
cd
sh -c "$(curl -fsLS get.chezmoi.io/lb)"
export PATH="$HOME/.local/bin:$PATH"
chezmoi init https://github.com/16thomja/dotfiles.git
chezmoi apply
```
