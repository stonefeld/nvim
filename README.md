# Neovim
Neovim confguration fully written in `lua`.

# Table of contents
* [Features](#features)
* [Example pictures](#example-pictures)
* [Installation](#installation)
* [Plugins](#plugins)
* [Keybindings](#keybindings)

# Features
This nvim setup features the following points:
* Fully `lua` based configuration
* Native `lsp` support
* Better syntax highlighting via `treesitter`
* Good integration with `telescope`
* Auto installing plugins via `packer.nvim`
* Protected package calling to prevent errors when plugin is not installed
* Fast and easy extensibility
* Clean configuration structure

# Example pictures
*pictures coming soon*

# Installation
The installation is pretty straight forward. Simply clone the repository into the corresponding folder, according to your operating system.

`~/.config/nvim/` on Linux and MacOS

`~/AppData/Local/nvim/` on Windows

After cloning the repository, open the `plugins.lua` file located in [`lua/stonefeld/plugins.lua`](https://github.com/stonefeld/nvim/tree/master/lua/stonefeld/plugins.lua) and save it by running `:w<Enter>`. This will activate the autocommand located in that file and `packer.nvim` will try to install every single plugin listed there.

By installing `treesitter`, it will try to install all available parsers.

# Plugins
*plugins coming soon*

# Keybindings
*keybindings coming soon*
