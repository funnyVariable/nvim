vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.o.number = true
vim.o.signcolumn = "yes"

require("config.keymap")

require("config.lazy")

-- i don't know why but it's required for gitsigns to work
require("gitsigns").setup()
