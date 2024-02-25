return {
  "williamboman/mason.nvim",
  dependencies = { "rshkarin/mason-nvim-lint" },
  config = function()
    require("mason").setup({})

    require("mason-nvim-lint").setup({
      ensure_installed = {
        "pylint"
      }
    })
  end
}
