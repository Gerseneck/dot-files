return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")

    local parsers = {
      "vimdoc",
      "python",
      "java",
      "ruby",
      "lua",
      "typescript",
      "javascript",
      "markdown",
    }

    treesitter.install(parsers)

    -- filetypes might have different names than parsers
    local filetypes = {
      "help",
      "python",
      "java",
      "ruby",
      "lua",
      "typescript",
      "javascript",
      "markdown",
    }

    local treesitter_autogroup = vim.api.nvim_create_augroup("treesitter", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      group = treesitter_autogroup,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
