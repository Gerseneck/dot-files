require("nvim-tree").setup({
  diagnostics = {
    enable = false,
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
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
          ignored = "◌",
        },
      },
    },
  },
  hijack_directories = { enable = false },
  disable_netrw = false,
  hijack_netrw = false,
})

vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<cr>")
