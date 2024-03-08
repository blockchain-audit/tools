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
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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

-- Install your plugins here
return packer.startup(function(use)

-- Package Management
use 'wbthomason/packer.nvim'

-- UI Theme
use 'navarasu/onedark.nvim'
use 'kyazdani42/nvim-web-devicons'
use 'nvim-lua/plenary.nvim'
use 'ctrlpvim/ctrlp.vim'

-- Status Line
use 'nvim-lualine/lualine.nvim'

-- Autocomplete
use 'neovim/nvim-lspconfig'
use 'williamboman/nvim-lsp-installer'
use 'jose-elias-alvarez/null-ls.nvim'

-- Yul
use 'mattdf/vim-yul'

use {
  'hrsh7th/nvim-cmp',
  requires = {
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'saadparwaiz1/cmp_luasnip',
  },
}

-- Fzf
use { 'ibhagwan/fzf-lua',
  requires = { 'nvim-tree/nvim-web-devicons' }
}

use {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
  end
}
-- Lean
use {
    'Julian/lean.nvim',
    requires = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
  }
}

-- Move
use 'rvmelkonian/move.vim'

-- Idris
use 'edwinb/idris2-vim'

-- D2
use 'terrastruct/d2-vim'

-- Dafny
use 'mlr-msft/vim-loves-dafny'

-- Huff
use 'wuwe1/vim-huff'

use 'hrsh7th/cmp-nvim-lua'

use 'simrat39/rust-tools.nvim'

-- Comments
use 'numToStr/Comment.nvim'
-- Navigation
use 'tpope/vim-vinegar'
use 'nvim-treesitter/nvim-treesitter'

use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}

-- chatGPT
use({
  "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})

use 'lewis6991/gitsigns.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)