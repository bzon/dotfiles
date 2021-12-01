# Table of Contents

<!-- vim-markdown-toc GFM -->

* [Prerequisites](#prerequisites)
* [Frameworks](#frameworks)
* [Prettify Terminal](#prettify-terminal)
  * [Install Oh My Zsh](#install-oh-my-zsh)
  * [Install Oh My Zsh plugins and extra utilities](#install-oh-my-zsh-plugins-and-extra-utilities)
  * [Configure zshrc file](#configure-zshrc-file)
* [NeoVim and Plugins](#neovim-and-plugins)

<!-- vim-markdown-toc -->

## Prerequisites

Install brew:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Setup .profile:

```bash
echo 'export PATH=$PATH:/usr/local/bin' > $HOME/.profile
source ~/.profile
```

## Frameworks

Install rvm and ruby:

```bash
curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Install python 3:

```bash
brew install python
```

Download and install __Go for MacOS__ [here](https://golang.org/doc/install)

## Prettify Terminal

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Install Powerline themes:

```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Install Powerline Nerd font:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-sourcecodepro-nerd-font
```

Install customization to powerlevel9k theme:

```bash
curl -fsSL -o ~/powerlevel9k.zsh https://raw.githubusercontent.com/bzon/dotfiles/master/powerlevel9k.zsh
```

### Install Oh My Zsh plugins and extra utilities

```bash
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
gem install colorls
brew install neofetch
brew install kube-ps1
```

### Configure zshrc file

* Backup the existing `./zshrc` for safety.
* Install the zshrc of this repo:
  ```bash
  curl -fsSL -o /.zshrc https://raw.githubusercontent.com/bzon/dotfiles/master/zshrc
  ```
* Run `brew info zsh-syntax-highlighting` and follow the instructions related to modification in the zshrc.
* Run `brew info zsh-autosuggestions` and follow the instructions related to modification in the zshrc.

## NeoVim and Plugins

Install neovim:

```bash
brew install neovim
```

Install Vim Plug for neovim:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Upgrade python client for neovim (needed for some plugins to work):

```bash
/usr/local/bin/pip3 install neovim
/usr/local/bin/pip3 install --upgrade neovim
```

Copy `./init.vim` to `~/.config/nvim/init.vim`, open it, source then install the plugins.

