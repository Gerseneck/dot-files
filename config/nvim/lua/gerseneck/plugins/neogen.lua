return {
  "danymat/neogen",
  version = "*",
  config = function()
    local neogen = require("neogen")
    neogen.setup {
      enabled = true,
      languages = {
        java = { template = { annotation_convention = "javadoc" } },
        lua = { template = { annotation_convention = "emmylua" } },
        python = { template = { annotation_convention = "google_docstrings" } },
        ruby = { template = { annotation_convention = "rdoc" } },
      },
    }

    vim.keymap.set("n", "<leader>ng", neogen.generate)
  end,
}
