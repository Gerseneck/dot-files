return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "vimdoc",
        "python",
        "java",
        "ruby",
        "lua",
        "typescript",
        "javascript",
      },
      indent = {
        enable = false,
      },
      highlight = {
        enable = true,
        disable = { "html" },
        additional_vim_regex_highlighting = { "markdown" },
      },
    }
  end,
}
