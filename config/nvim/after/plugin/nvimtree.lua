require("nvim-tree").setup()

vim.keymap.set({'n', 'v', 'i'}, '<C-f>', '<cmd>NvimTreeToggle<cr>',
	{silent = true, noremap = true}
)
