local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- get all the plugins
return packer.startup(function(use)
	-- Base
	use("wbthomason/packer.nvim") -- packer manages itself
	use("mbbill/undotree") -- undo tree
	use("tpope/vim-fugitive")

	use({'nvim-tree/nvim-tree.lua',
		  requires = {
	             'nvim-tree/nvim-web-devicons', -- optional, for file icons
		  },
		  tag = 'nightly' -- optional, updated every week. (see issue #1193)
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ':TSUpdate'
	})

	-- LSP
	use({
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	  }
	})

	-- Colors
	use({
		"catppuccin/nvim", as = "catppuccin"
	}) -- catpuccin colorscheme
	use({
		"dracula/vim", as = "dracula"
	}) -- dracula colorscheme

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
