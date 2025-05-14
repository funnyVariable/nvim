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

local setIblColorDark = [[
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#444444" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#888888" })
require("ibl").setup({ indent = { char = "│", highlight = "IblIndent", }, scope = { enabled = true, highlight = "IblScope", show_start = false, show_end = false, }, })
]]

local setIblColorLight = [[
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#dddddd" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#aaaaaa" })
require("ibl").setup({ indent = { char = "│", highlight = "IblIndent", }, scope = { enabled = true, highlight = "IblScope", show_start = false, show_end = false, }, })
]]

local dark = [[ vim.o.background = "dark" ]]
local light = [[ vim.o.background = "light" ]]

return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        {
          name = "vscode Light",
          colorscheme = "vscode",
          before = light,
          after = vscodeLightAfter,
        },
        {
          name = "vscode Dark",
          colorscheme = "vscode",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Kanagawa dragon",
          colorscheme = "kanagawa-dragon",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Kanagawa wave",
          colorscheme = "kanagawa-wave",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Kanagawa lotus",
          colorscheme = "kanagawa-lotus",
          before = light,
          after = setIblColorLight,
        },
        {
          name = "Nightfox",
          colorscheme = "nightfox",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Dayfox",
          colorscheme = "dayfox",
          before = light,
          after = setIblColorLight,
        },
        {
          name = "Dawnfox",
          colorscheme = "dawnfox",
          before = light,
        },
        {
          name = "Duskfox",
          colorscheme = "duskfox",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Nordfox",
          colorscheme = "nordfox",
          before = dark,
        },
        {
          name = "Terafox",
          colorscheme = "terafox",
          before = dark,
        },
        {
          name = "Carbonfox",
          colorscheme = "carbonfox",
          before = dark,
        },
        {
          name = "Gruvbox Material (Dark)",
          colorscheme = "gruvbox-material",
          before = dark,
        },
        {
          name = "Gruvbox Material (Light)",
          colorscheme = "gruvbox-material",
          before = light,
        },
        {
          name = "Github Dark",
          colorscheme = "github_dark",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Github Light",
          colorscheme = "github_light",
          before = light,
          after = setIblColorLight,
        },
        {
          name = "Github Dark Dimmed",
          colorscheme = "github_dark_dimmed",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Github Dark Default",
          colorscheme = "github_dark_default",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Github Light Default",
          colorscheme = "github_light_default",
          before = light,
          after = setIblColorLight,
        },
        {
          name = "Github Dark High Contrast",
          colorscheme = "github_dark_high_contrast",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Github Light High Contrast",
          colorscheme = "github_light_high_contrast",
          before = light,
          after = setIblColorLight,
        },
        {
          name = "Github Dark Tritanopia",
          colorscheme = "github_dark_tritanopia",
          before = dark,
          after = setIblColorDark,
        },
        {
          name = "Github Light Tritanopia",
          colorscheme = "github_light_tritanopia",
          before = light,
          after = setIblColorLight,
        },
      },
      livePreview = true,
    })
  end,
}
