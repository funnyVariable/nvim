return {
  "Mofiqul/vscode.nvim",
  opts = { style = "light", underline_links = true },
  config = function()
    vim.o.background = "light"
    vim.cmd.colorscheme("vscode")
  end,
}
