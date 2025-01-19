Make sure sudo, nano, and curl are installed

/lb means chezmoi gets installed in .local/bin

```
sh -c "$(curl -fsLS get.chezmoi.io/lb)"
chezmoi init https://github.com/16thomja/dotfiles.git
chezmoi apply
```
