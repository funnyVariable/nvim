vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.background = "light"

vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,localoptions"

vim.cmd("set shellcmdflag=-ic")
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
vim.cmd([[
highlight NvimTreeNormal guibg=#f2f2f2
highlight NvimTreeOpenedFolderName guibg=#E5E5E5
]])

-- Move the cursor to the right when opening a text file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      require("nvim-tree.api").tree.open()
      vim.cmd("wincmd p")
    end)
  end,
})

-- Switch themes

local function set_ibl_colors(light)
  if light then
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#dddddd" })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#aaaaaa" })
  else
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#444444" })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#888888" })
  end

  require("ibl").setup({
    indent = {
      char = "│",
      highlight = "IblIndent",
    },
    scope = {
      enabled = true,
      highlight = "IblScope",
      show_start = false,
      show_end = false,
    },
  })
end

vim.api.nvim_create_user_command("Dark", function()
  vim.o.background = "dark"
  require("vscode").setup({ style = "dark" })
  require("vscode").load()
  set_ibl_colors(false)
end, {})

vim.api.nvim_create_user_command("Light", function()
  vim.o.background = "light"
  require("vscode").setup({ style = "light" })
  require("vscode").load()
  vim.cmd([[highlight NvimTreeNormal guibg=#f2f2f2]])
  set_ibl_colors(true)
end, {})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})

-- Delete current file
vim.api.nvim_create_user_command("Del", function()
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)

  if vim.bo[buf].readonly or not vim.bo[buf].modifiable then
    vim.notify("Cannot delete a read-only or unmodifiable buffer", vim.log.levels.WARN)
    return
  end

  if file == "" then
    vim.notify("No file to delete", vim.log.levels.WARN)
    return
  end

  vim.fn.delete(file)
  vim.cmd("bdelete!")
  vim.notify("Deleted " .. file, vim.log.levels.INFO)
end, {})
