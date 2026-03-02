vim.g.mapleader = " "

-- move blocks of code up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", [[ "+Y ]])
vim.keymap.set("v", "<leader>y", [[ "+y ]])

-- select entire file content
vim.keymap.set("n", "gG", "ggVG")

-- yank filename (relative path) and line number to clipboard
vim.keymap.set("n", "<leader>cl", function()
  local filename_line_number = vim.fn.expand("%") .. ":" .. vim.fn.getcurpos()[2]

  vim.fn.setreg("+", filename_line_number)

  print(string.format('Yanked current filename (relative) and line number to register "+: %s', filename_line_number))
end)

-- easier window splits commands
-- resize
vim.keymap.set("n", "<A-,>", "<C-w><")
vim.keymap.set("n", "<A-.>", "<C-w>>")
vim.keymap.set("n", "<A-->", "<C-w>-")
vim.keymap.set("n", "<A-+>", "<C-w>+")
vim.keymap.set("n", "<A-=>", "<C-w>=")
-- navigation
vim.keymap.set("n", "<A-w>", "<C-w>w")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
