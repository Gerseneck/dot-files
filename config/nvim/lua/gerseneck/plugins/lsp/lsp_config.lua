return {
  "neovim/nvim-lspconfig",
  cmd = "LspInfo",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "williamboman/mason-lspconfig.nvim" }
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()

    require("mason-lspconfig").setup({
      ensured_installed = {
        "pyright",
        "jdtls",
        "ruby_ls",
        "clangd",
        "tsserver",
        "emmet_ls",
        "html",
        "texlab"
      },
      handlers = {
        lsp_zero.default_setup
      }
    })

    lsp_zero.set_sign_icons({
      error = "✘",
      warn = "▲",
      hint = "⚑",
      info = ""
    })

    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true
    })

    lsp_zero.on_attach(function(client, buffer)
      local opts = { buffer = buffer, remap = false }

      vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    end)
  end
}
