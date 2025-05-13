local vscodeLightAfter = [[
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#dddddd" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#aaaaaa" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#f2f2f2" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { bg = "#E5E5E5" })
require("ibl").setup({
  indent = { char = "│", highlight = "IblIndent" },
  scope = { enabled = true, highlight = "IblScope", show_start = false, show_end = false },
})
]]
local vscodeDarkAfter = [[
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#444444" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#888888" })
require("ibl").setup({ indent = { char = "│", highlight = "IblIndent", }, scope = { enabled = true, highlight = "IblScope", show_start = false, show_end = false, }, })
]]

return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        {
          name = "vscode Light",
          colorscheme = "vscode",
          before = [[ vim.o.background = "light" ]],
          after = vscodeLightAfter,
        },
        {
          name = "vscode Dark",
          colorscheme = "vscode",
          before = [[ vim.o.background = "dark" ]],
          after = vscodeDarkAfter,
        },
      },
      livePreview = true,
    })
  end,
}
