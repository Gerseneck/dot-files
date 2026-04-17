require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        folder_arrow = false,
      },
      glyphs = {
        git = {
          unstaged = "[M]",
          staged = "[+]",
          unmerged = nil,
          renamed = "[R]",
          untracked = "[?]",
          deleted = "[✘]",
          ignored = nil,
        },
      },
    },
  },
})

vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<cr>")
