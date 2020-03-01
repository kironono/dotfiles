# dotfiles

## Install

Install [rcm](https://github.com/thoughtbot/rcm):

```sh
brew tap thoughtbot/formulae
brew install rcm
```

Install dotfiles:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/kironono/dotfiles/develop/.tools/install.sh)"
```

Run rcup:

```sh
env RCRC=$HOME/dotfiles/rcrc rcup
```
