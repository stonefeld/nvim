-- ---------- Plugins ---------- --
-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer. Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocmd that reloads Neovim when the plugins.lua file is written
vim.cmd [[
  aug packer_user_config
    au!
    au BufWritePost plugins.lua source <afile> | PackerSync
  aug end
]]

-- Use a protected call to not error out on the first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Use a floating window for packer
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"           -- make packer handle itself
  use "neovim/nvim-lspconfig"            -- enable lsp
  use "williamboman/nvim-lsp-installer"  -- simple to use language server installer
  use "hrsh7th/nvim-cmp"                 -- completion plugin
  use "hrsh7th/cmp-nvim-lsp"             -- lsp completions
  use "hrsh7th/cmp-buffer"               -- buffer completions
  use "hrsh7th/cmp-path"                 -- path completions
  use "saadparwaiz1/cmp_luasnip"         -- snippet completions
  use "L3MON4D3/LuaSnip"                 -- snippet support
  use "rafamadriz/friendly-snippets"     -- snippets list
  use {                                  -- telescope fuzzy finder
    "nvim-telescope/telescope.nvim",
    requires = {
      use "nvim-lua/popup.nvim",         -- popup api
      use "nvim-lua/plenary.nvim",       -- useful lua function required by many packages
    },
  }
  use {                                  -- syntax highlighting with treesitter
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "stonefeld/nordokai"               -- my own colorscheme
  use "kyazdani42/nvim-web-devicons"     -- devicons for telescope

  -- Automatically set up the configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
