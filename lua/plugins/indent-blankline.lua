return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  config = function()
    -- Indent line
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#e3e3e3", nocombine = true })

    -- Current scope
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#c0c0c0", nocombine = true })

    require("ibl").setup({
      indent = {
        char = "│",
        highlight = "IblIndent",
      },
      scope = {
        enabled = true,
        highlight = "IblScope",
      },
    })
  end,
}
