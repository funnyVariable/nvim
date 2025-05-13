return {
  "NvChad/nvim-colorizer.lua",
  opts = {
    filetypes = {
      "*", -- Highlight all files, but customize some others.
      cmp_menu = { always_update = true },
      cmp_docs = { always_update = true },
    },
    user_default_options = {
      tailwind = true,
      css = true,
      rgb_fn = true,
      hsl_fn = true,
      css_fn = true,
      mode = "virtualtext",
      virtualtext = "■",
      virtualtext_inline = "before",
    },
  },
}
