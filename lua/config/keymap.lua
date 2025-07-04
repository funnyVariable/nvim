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

-- Rename refrences
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

-- Format
vim.keymap.set("n", "F", function()
  require("conform").format({ async = true })
end)

-- Linting
vim.keymap.set("n", "<leader>l", function()
  require("lint").try_lint()
end)

-- Map : for ;
vim.keymap.set("n", ";", ":")

-- Map Q for :qa
vim.keymap.set("n", "Q", ":q<CR>")

-- Toggle relative line number
vim.keymap.set("n", "<leader>r", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end)

-- Mapping % to E for easier access
vim.keymap.set("n", "E", "%")
vim.keymap.set("v", "E", "%")

-- Comment
-- <C-/> is interpreted as <C-_>
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, silent = true })
vim.keymap.set("i", "<C-_>", "<C-c>gcci", { remap = true, silent = true })

-- Select all
vim.keymap.set("n", "<leader>a", "gg0v$G")

--- Search ---

-- Search for word under cursor
vim.keymap.set("n", "<leader>/", function()
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("/", word .. "\\c")
  vim.o.hlsearch = true
end, { desc = "Highlight word under cursor (no scroll)" })

-- Search (case-insensitive)
vim.keymap.set("n", "/", "/\\c<Left><Left>", { silent = true })

-- Clear search highlight
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })

--- Search end ---

-- Moving lines
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")

-- Paste yanked text in insert mode
vim.keymap.set("i", "<C-p>", function()
  local yanked = vim.fn.getreg('"')
  vim.api.nvim_put({ yanked }, "c", false, true)
end, { noremap = true })

-- Navigation + undo in insert mode
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-b>", "<C-Left>")
vim.keymap.set("i", "<C-w>", "<C-Right>")
vim.keymap.set("i", "<C-u>", "<C-o>u")

-- ZZ
vim.keymap.set("n", "L", "zz")
vim.keymap.set("i", "<A-l>", "<C-c>zzi")

-- Registers
vim.keymap.set("n", "gm", '"', { noremap = true })

-- GitSigns
vim.keymap.set("n", "<leader>g", "<Cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>G", "<Cmd>Gitsigns reset_hunk<CR>")

---- Buffers ----

-- Move to previous/next
vim.keymap.set("n", "<A-h>", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<A-l>", "<Cmd>bnext<CR>")

-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>bdelete<CR>")

---- Buffers End ----

---- LSP ----

-- K -> Shows diagnostics if there is a problem and
-- calls vim.lsp.buf.hover if there is no problem

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
vim.keymap.set("n", "<leader>q", ":qall<CR>",{ noremap = true})
vim.keymap.set("n", "<leader>w", ":w<CR>",{ noremap = true})

-- Toggle NvimTree
vim.keymap.set("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")

-- Themery
vim.keymap.set("n", "<C-s>", "<CMD>Themery<CR>")
