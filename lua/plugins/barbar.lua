return {
  "romgrk/barbar.nvim",
  config = function()
    -- Move to previous/next
    vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>")
    vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>")

    -- Re-order to previous/next
    vim.keymap.set("n", "<A-a>", "<Cmd>BufferMovePrevious<CR>")
    vim.keymap.set("n", "<A-d>", "<Cmd>BufferMoveNext<CR>")

    -- Goto buffer in position...
    vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
    vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
    vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
    vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
    vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
    vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
    vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
    vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
    vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
    vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")

    -- Close buffer
    vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")
  end,
}
