vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true

require("config.keymap")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		{ "Mofiqul/vscode.nvim" },
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "stevearc/conform.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "lewis6991/gitsigns.nvim" },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Plugins
require("plugins.treesitter")
require("plugins.conform")
require("plugins.gitsigns")

-- Theme
require("vscode").setup({
	style = "light",
	italic_comments = true,
})

require("vscode").load()
