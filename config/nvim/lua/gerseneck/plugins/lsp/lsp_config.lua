return {
  "neovim/nvim-lspconfig",
  cmd = "LspInfo",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "williamboman/mason.nvim" },
    { "rshkarin/mason-nvim-lint" },
    { "williamboman/mason-lspconfig.nvim" }
  },
  config = function()
    local lsp_config = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "jdtls",
        "ruby_lsp",
        "clangd",
        "tsserver",
        "emmet_ls",
        "html",
        "texlab"
      },
      handlers = {
        function(server_name)
          lsp_config[server_name].setup({
            capabilities = capabilities
          })
        end,

        ["lua_ls"] = function()
          lsp_config.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          })
        end
      }
    })

    require("mason-nvim-lint").setup({
      ensure_installed = {
        "pylint"
      }
    })

    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true
    })

    vim.fn.sign_define("DiagnosticSignError", { text = "✘" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "▲" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "⚑" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "" })

    vim.opt.signcolumn = "auto"
  end
}
