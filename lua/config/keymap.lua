vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })

-- Format
vim.keymap.set("n", "<leader>r", function()
	require("conform").format()
end)

-- GitSigns
vim.keymap.set("n", "<leader>g", "<Cmd>Gitsigns preview_hunk<CR>")

---- Buffers ----

-- Move to previous/next
vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>")

-- Re-order to previous/next
vim.keymap.set("n", "<A-j>", "<Cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<A-k>", "<Cmd>BufferMoveNext<CR>")

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

---- Buffers End ----
