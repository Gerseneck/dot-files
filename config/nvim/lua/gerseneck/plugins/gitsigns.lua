return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({})

    vim.keymap.set("n", "<leader>ph", gitsigns.preview_hunk)
    vim.keymap.set("n", "<leader>rh", gitsigns.reset_hunk)
    vim.keymap.set("n", "<leader>gb", gitsigns.blame)
    vim.keymap.set("n", "[h", gitsigns.prev_hunk)
    vim.keymap.set("n", "]h", gitsigns.next_hunk)
  end
}
