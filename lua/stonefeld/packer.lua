local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd.packadd("packer.nvim")
end

local pk_ok, pk = pcall(require, "packer")
if not pk_ok then
  return
end

local auto_sync_packer = vim.api.nvim_create_augroup("auto_sync_packer", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = auto_sync_packer,
  pattern = "packer.lua",
  command = [[so <afile> | PackerSync]],
})

pk.startup(function(use)
  -- let packer handle itself
  use("wbthomason/packer.nvim")

  -- best colorscheme out there
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })

  -- nice statusline
  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")
  use("SmiteshP/nvim-navic")

  -- better syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })

  -- fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
  })

  -- fuzzy finder algorithm for telescope
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cond = vim.fn.executable("make") == 1,
  })

  -- setup lsp
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- lsp support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "saadparwaiz1/cmp_luasnip" },

      -- snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },

      -- formatter
      { "jose-elias-alvarez/null-ls.nvim" },

      -- status
      { "j-hui/fidget.nvim" },
    },
  })

  if is_bootstrap then
    pk.sync()
  end
end)
