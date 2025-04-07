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

require("config.keymap")

require("config.lazy")

vim.cmd("NvimTreeToggle")
vim.cmd([[highlight NvimTreeNormal guibg=#f2f2f2]])

-- Autoclose NvimTree when quitting
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.bo[vim.api.nvim_get_current_buf()].filetype == "NvimTree" then
      vim.cmd("quit")
    end
  end
})
