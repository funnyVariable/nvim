vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.o.number = true
vim.o.signcolumn = "yes"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.wrap = false

require("config.keymap")

require("config.lazy")

vim.cmd("NvimTreeToggle")

vim.cmd([[highlight NvimTreeNormal guibg=#f2f2f2]])

vim.cmd([[autocmd VimEnter * lua vim.defer_fn(function() vim.cmd('wincmd p') end, 100)]])
