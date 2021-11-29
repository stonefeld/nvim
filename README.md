# Neovim
This is my custom nvim setup. I have been building this setup for quite a long time. I built this repostory to save the setup I have been working on, so, in case of need or loss I can replicate the setup in any machine.

# Table of contents
* [Features](#features)
* [Example pictures](#example-pictures)
* [Installation](#installation)
* [Plugins](#plugins)
* [Keybindings](#keybindings)

# Features
This nvim setup features the following points:
* LSP configuration for a bunch of language servers
* Better syntax highlighting via Treesitter
* Clean configuration structure
* Install script for MacOS and Linux users
* Fast and lightweight configuration for slow machines
* Needed-only plugins to debloat the environment

# Example pictures
*pictures coming soon*

# Installation
The installation is pretty straight forward. Simply clone the repository into the corresponding folder, according to your operating system.

`~/.config/nvim/` on Linux and MacOS

`~/AppData/Local/nvim/` on Windows

After cloning the repository, if you are at least on linux, the `install.sh` file could be run to initialize the nvim setup (problems could be expected).

If the installation script does not run accordingly you have to follow some steps.

### 1. Clone the [vim-plug](https://github.com/junegunn/vim-plug) repository

If you are on Linux or MacOS
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

If you are on Windows
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

### 2. Install all plugins
Open `init.vim` and run the following commands

1. Source the file: `:so %`
2. Install the plugins: `:PlugInstall`
3. Since one of the plugins is treesitter, you will want to install the parsers you are going to use by running `:TSInstall {language}`, or install every parser by running `:TSInstall all maintained`

### 3. Install all required language servers
Since we are using nvim 0.5 or above, you will have the lsp feature builtin. You only have to install the corresponding language servers.

`lua/stonefeld/lsp.lua` has all the configuration for the language servers I use. You can freely add any configuration you want, for more information head towards [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)'s README or run `:h lspconfig`.

Now I will list all the language servers you will need to get this current setup working.
* `bash` by running `npm i -g bash-language-server`
* `clangd` by installing `clang` with your package manager
* `cmake` by running `pip install cmake-language-server`
* `cssls` by running `npm i -g vscode-css-languageserver-bin`
* `html` by running `npm i -g vscode-html-languageserver-bin`
* `pylsp` by running `pip install python-language-server[all]`
* `tsserver` by running `npm i -g typescript-language-server`
* `vimls` by running `npm i -g vim-language-server`

# Plugins
The following list are the plugins needed in my workflow
* [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) for lsp support
* [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp), [`hrsh7th/cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp), [`hrsh7th/cmp-path`](https://github.com/hrsh7th/cmp-path) for autocompletion support
* [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) for treesitter support
* [`sheerun/vim-polyglot`](https://github.com/sheerun/vim-polyglot) in case treesitter does not support a certain language, since vim-polyglot does have a longer lifetime
* [`stonefeld/nordokai`](https://github.com/stonefeld/nordokai) colorscheme made by me, inspired by nord, gruvbox, monokai-pro and material colorschemes.

# Keybingins
*keybindings coming soon*


