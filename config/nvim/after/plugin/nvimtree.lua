require("nvim-tree").setup({
   renderer = {
       icons = {
           show = {
               folder_arrow = false;
           },
           glyphs = {
               git = {
                   unstaged = '[M]',
                   staged = '[+]',
                   unmerged = '',
                   renamed = '[R]',
                   deleted = '[✘]',
                   untracked = '[?]',
                   ignored = ''
               }

           }
       }
   }
})

vim.keymap.set({'n', 'v', 'i'}, '<C-f>', '<cmd>NvimTreeToggle<cr>',
	{ silent = true, noremap = true }
)
