local fzf_lua = require("fzf-lua")

fzf_lua.setup({
  window = {
    file_icon_padding = " ",
  },
  winopts = {
    treesitter = { enabled = true },
    preview = {
      wrap = true,
      scrollbar = false,
    },
  },
})

vim.keymap.set("n", "<leader>ff", fzf_lua.files)
vim.keymap.set("n", "<leader>fp", fzf_lua.git_files)
vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep)
vim.keymap.set("n", "<leader>fb", fzf_lua.buffers)
vim.keymap.set("n", "<leader>fh", fzf_lua.helptags)
vim.keymap.set("n", "<leader>fm", fzf_lua.manpages)
