return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {
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
    }

    vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<cr>", { silent = true, noremap = true })
  end,
}
