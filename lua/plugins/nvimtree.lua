return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      width = 25,
    },
    filters = {
      dotfiles = false,
      custom = { ".git" },
    },
  },
}
