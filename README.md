# Dotfiles

Elise Shaffer's dotfiles

## Dependencies

1. XCode && XCode Command Line Tools
1. You will need to have your ssh-key attached to BOTH your github and gitlab accounts

## Linking Dotfiles

I used this method of creatin

```shell
./install default home
```
## Post Install Steps

Install the Homebrew bundle:

```shell
brew bundle --file brew/home.brewfile
```

Install the latest ruby and node versions:

```shell
ruby-install --latest
nvm install --lts
```

## Other Things

1. Remap Ctrl-R to Ignore in iTerm settings.
1. Download Magnet from the MAS.
1. Install the itermcolors/presets in the itermcolors folder.

Optional:

1. Add `/usr/local/bin/zsh` to `/etc/shells`
1. `chsh -s /usr/local/bin/zsh`
