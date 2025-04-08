vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })

-- Format
vim.keymap.set("n", "F", vim.lsp.buf.format)

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

---- LSP ----

-- m -> Calls vim.lsp.buf.hover despite if there is a problem or not
vim.keymap.set("n", "m", vim.lsp.buf.hover, { noremap = true, silent = true })

-- K -> Shows diagnostics if there is a problem and calls vim.lsp.buf.hover if there is not problem
vim.keymap.set("n", "K", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover()
  end
end, { noremap = true, silent = true })

-- Jump to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

---- LSP END ----

-- Navigate split view
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>:q<CR>')

-- Toggle NvimTree
vim.keymap.set('n', '<leader>t', '<CMD>NvimTreeToggle<CR>')
