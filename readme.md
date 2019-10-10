# Table of Contents

<!-- vim-markdown-toc GFM -->

* [Prerequisites](#prerequisites)
* [Frameworks](#frameworks)
* [Prettify Terminal](#prettify-terminal)
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

Install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Install Powerline themes:

```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Install Powerline Nerd font:

```bash
brew tap caskroom/fonts
brew cask install font-sourcecodepro-nerd-font
```

Install Oh My Zsh plugins and extra utilities:

```bash
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
gem install colorls
brew install neofetch
brew install kube-ps1
```

Configure zshrc file:

Copy `./zshrc` to `~/.zshrc`.

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

