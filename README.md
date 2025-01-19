Make sure sudo, nano, and curl are installed

Add chezmoi installation dir to PATH

```
sh -c "$(curl -fsLS get.chezmoi.io)"
chezmoi init https://github.com/16thomja/dotfiles.git
chezmoi apply
```
