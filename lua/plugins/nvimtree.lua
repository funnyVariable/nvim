return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },

  opts = {
    view = {
      width = 25,
    },
    filters = {
      dotfiles = false,
      custom = { ".git" },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
  },
}
