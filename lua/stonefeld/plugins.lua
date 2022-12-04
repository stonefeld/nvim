-- ---------- Plugins ---------- --
-- automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer. Close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- sync and update the plugins when this file gets written to disk
vim.cmd([[
  aug packer_user_config
    au!
    au BufWritePost plugins.lua source <afile> | PackerSync
  aug end
]])

-- use a protected call to not error out on the first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- use a floating window for packer
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Install plugins here
return packer.startup(function(use)
	-- let packer handle itself
	use("wbthomason/packer.nvim")

	-- easy to use and configure lsp and formatting
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- integrating an autocompletion engine with lsp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")

	-- adding a snippets engine and a big collection of them
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- fuzzy finder to move quickly across files
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			use("nvim-lua/popup.nvim"),
			use("nvim-lua/plenary.nvim"),
			use({
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			}),
		},
	})

	-- adding icons to telescope
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- adding a really nice colorscheme
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		run = ":CatppuccinCompile",
	})

	-- using the dap protocol to debug projects
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")

	-- automatically set up the configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
