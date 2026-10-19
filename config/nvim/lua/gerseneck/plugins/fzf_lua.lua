local fzf_lua = require("fzf-lua")

fzf_lua.setup({
  files = {
    absolute_path = false,
    color_icons = true,
    file_icons = true,
    git_icons = true,
    hidden = true,
    multiprocesses = true,
    no_ignore = true,
  },
  grep = {
    actions = {
      ["ctrl-q"] = { fn = fzf_lua.actions.file_sel_to_qf, prefix = "select-all+" },
    },
  },
  window = {
    file_icon_padding = " ",
  },
  winopts = {
    border = "rounded",
    preview = {
      border = "rounded",
      scrollbar = false,
      title_pos = "center",
      title = true,
      wrap = true,
    },
    treesitter = { enabled = true },
  },
})

vim.keymap.set("n", "<leader>ff", fzf_lua.files)
vim.keymap.set("n", "<leader>fp", fzf_lua.git_files)
vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep)
vim.keymap.set("n", "<leader>fb", fzf_lua.buffers)
vim.keymap.set("n", "<leader>fh", fzf_lua.helptags)
vim.keymap.set("n", "<leader>fm", fzf_lua.manpages)
vim.keymap.set("n", "<leader>fc", fzf_lua.colorschemes)
