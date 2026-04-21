local map = vim.keymap.set

map("n", "<leader>?", "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up centered" })
map("n", "n", "nzzzv", { desc = "Next search centered" })
map("n", "N", "Nzzzv", { desc = "Previous search centered" })

map("x", "<leader>p", [=["_dP]=], { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>y", [=["+y]=], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [=["+Y]=], { desc = "Yank line to system clipboard" })
