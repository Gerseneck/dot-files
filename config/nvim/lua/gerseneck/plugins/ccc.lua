return {
  "uga-rosa/ccc.nvim",
  config = function()
    local ccc = require("ccc")

    ccc.setup({
      lsp = true,
      highlighter = {
        auto_enable = true,
        lsp = true,
        filetypes = { "html", "css", "scss", "sass" },
      },
      recognize = {
        input = true,
        output = true,
      },
    })

    vim.keymap.set("n", "<leader>cc", "<cmd>CccPick<cr>")
    vim.keymap.set("n", "<leader>cf", "<cmd>CccConvert<cr>")
  end,
}
