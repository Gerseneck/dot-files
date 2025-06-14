vim.g.mapleader = " "

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", [[ "+Y ]])
vim.keymap.set("v", "<leader>y", [[ "+y ]])

vim.keymap.set("n", "gG", "ggVG")
