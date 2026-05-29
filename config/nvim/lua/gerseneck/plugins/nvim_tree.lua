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
  hijack_directories = { enable = false },
  disable_netrw = false,
  hijack_netrw = false,
})

vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<cr>")
