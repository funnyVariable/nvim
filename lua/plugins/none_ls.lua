return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.formatting.stylua,
      },
    })
  end,
}
