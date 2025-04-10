-- Telescope find files
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    hidden = true,
    find_command = {
      "rg",
      "--files",
      "--hidden",
      "--glob",
      "!.git/*",
    },
  })
end)

-- Telescope live grep
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>")

-- Format
vim.keymap.set("n", "F", function()
 require("conform").format({ async = true }) 
end)

-- Linting
vim.keymap.set("n", "<leader>l", function()
  require("lint").try_lint()
end)

-- Comment
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, silent = true })

-- GitSigns
vim.keymap.set("n", "<leader>g", "<Cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>G", "<Cmd>Gitsigns reset_hunk<CR>")

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

-- it also jumps to given line number if it was prefixed by a number
vim.keymap.set("n", "n", function()
  local current_pos = vim.api.nvim_win_get_cursor(0)
  local col = current_pos[2]

  if vim.v.count > 0 then
    vim.api.nvim_win_set_cursor(0, { vim.v.count, col })
  end
end)

-- K -> Shows diagnostics if there is a problem and
-- calls vim.lsp.buf.hover if there is not problem

-- <leader>k Calls vim.lsp.buf.hover despite there is problem or not

vim.keymap.set("n", "K", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover()
  end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>k", function()
  vim.lsp.buf.hover()
end, { noremap = true, silent = true })

-- Jump to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

---- LSP END ----

-- Navigate split view
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Quit + Write
vim.keymap.set("n", "<leader>q", ":qall<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Toggle NvimTree
vim.keymap.set("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")
