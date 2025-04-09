return {
  "rmagatti/auto-session",
  opts = {
    log_level = "error",
    auto_restore_enabled = true,
    auto_save_enabled = true,
    auto_session_enable_last_session = false,
    auto_session_use_git_branch = false,
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },

    pre_save_cmds = {
      function()
        -- Safely try to close NvimTree
        pcall(vim.cmd, "NvimTreeClose")
        -- Safely try to close Barbar
        pcall(vim.cmd, "BarbarClose")
      end,
    }, -- Close these before saving

    post_restore_cmds = {
      function()
        -- Close any empty buffers that might have been created
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_get_name(buf) == "" and vim.api.nvim_buf_get_option(buf, "buftype") == "" then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
        -- Focus first non-empty buffer
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_buf_get_name(buf) ~= "" then
            vim.api.nvim_set_current_win(win)
            break
          end
        end
      end,
    },
  },
}
