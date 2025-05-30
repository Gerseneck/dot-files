return {
  "tpope/vim-fugitive",
  init = function()
    vim.keymap.set("n", "<leader>ds", "<cmd>Gvdiffsplit!<cr>")
  end,
}
