# My Neovim Config

Hey guys, this is the Neovim config that I learned from Josean Martinez on Youtube "How I Setup Neovim To Make It AMAZING in 2024: The Ultimate Guide"

But of course, I changed a lot throughout my experience with Neovim to fit my taste and add more notes so that I can recall some information.

You guys can fork or clone this to use for your Neovim. Remember to watch the Youtube video by Josean to have a better understanding of each plugin is doing.

## Prerequisites

Besides Neovim itself and many plugins, some plugins require extra packages available from your shell.

I cannot recall everything since there are many dependencies from different plugins.

Here are some of the dependencies that live outside of Neovim ecosystem:

- eza (better ls)
- fzf (Fuzzy find files)
- fd (better find)

To know whether a plugin depends on something from your environment, check that plugin Github page and documentation.

## My main dotfiles repository

[Dotfiles Github link](https://github.com/doanhtu07/my-terminal-dotfiles)

## Extra notes

- **Jedi Language Server**
  - https://www.reddit.com/r/neovim/comments/1603eif/adding_extra_paths_to_jedilanguageserver/
  - https://github.com/pappasam/jedi-language-server/issues/199

## Quick use

### Linux

---

Install homebrew to install neovim v10

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Run these two commands in your terminal to add Homebrew to your PATH:

```
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

- Install Homebrew's dependencies if you have sudo access:

```
sudo apt-get install build-essential
```

- We recommend that you install GCC:

```
brew install gcc
```

Install Neovim

```
brew install neovim
```

Install some stuff for Mason

```
brew install npm
brew install unzip
brew install curl
brew install tar
brew install gzip
```

---

Setup config

```
mkdir -p ~/.config/nvim

cd ~/.config/nvim

git clone https://github.com/doanhtu07/my-neovim-config.git .
```

---
