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

-- Open NvimTree on launch
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      require("nvim-tree.api").tree.open()
    end)
  end,
})

-- Edit NvimTree background color
vim.cmd([[highlight NvimTreeNormal guibg=#f2f2f2]])

-- Move the cursor to the right when opening a text file
vim.cmd([[autocmd VimEnter * lua vim.defer_fn(function() vim.cmd('wincmd p') end, 50)]])

-- Switch themes
vim.api.nvim_create_user_command("Dark", function()
  vim.o.background = "dark"
  require("vscode").setup({
    style = "dark",
  })
  require("vscode").load()
end, {})

vim.api.nvim_create_user_command("Light", function()
  vim.o.background = "light"
  require("vscode").setup({
    style = "light",
  })
  require("vscode").load()
  vim.cmd([[highlight NvimTreeNormal guibg=#f2f2f2]])
end, {})
