return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      { "saadparwaiz1/cmp_luasnip" },
    },
  },

  { "hrsh7th/cmp-nvim-lsp" },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      luasnip.filetype_extend("typescript", { "javascript" })
      luasnip.filetype_extend("javascriptreact", { "javascript" })
      luasnip.filetype_extend("typescriptreact", { "javascript" })

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/my-snippets" })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- window = {
        --   completion = cmp.config.window.bordered(false),
        --   documentation = cmp.config.window.bordered(false),
        -- },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-f>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.config.disable, -- Exclude C-p
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
