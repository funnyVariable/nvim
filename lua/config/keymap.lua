vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })

-- Format
vim.keymap.set("n", "<leader>r", function()
	require("conform").format()
end)
