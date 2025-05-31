return {
  "neovim/nvim-lspconfig",
  cmd = "LspInfo",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "williamboman/mason.nvim" },
    { "rshkarin/mason-nvim-lint" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    local lsp_config = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local function add_ruby_deps_command(client, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
        local params = vim.lsp.util.make_text_document_params()
        local showAll = opts.args == "all"

        client.request("rubyLsp/workspace/dependencies", params, function(error, result)
          if error then
            print("Error showing deps: " .. error)
            return
          end

          local qf_list = {}
          for _, item in ipairs(result) do
            if showAll or item.dependency then
              table.insert(qf_list, {
                text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
                filename = item.path,
              })
            end
          end

          vim.fn.setqflist(qf_list)
          vim.cmd("copen")
        end, bufnr)
      end, {
        nargs = "?",
        complete = function()
          return { "all" }
        end,
      })
    end

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "jdtls",
        "ruby_lsp",
        "clangd",
        "ts_ls",
        "emmet_language_server",
        "html",
        "texlab",
      },
    })

    require("mason-nvim-lint").setup({
      ensure_installed = {
        "pylint",
      },
    })

    vim.lsp.config("*", {
      capabilities = capabilities,
    })
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      settings = {
        python = {
          pythonPath = vim.fn.exepath("python3"),
        },
      },
    })
    vim.lsp.config("ruby_lsp", {
      capabilities = capabilities,
      on_attach = function(client, buffer)
        add_ruby_deps_command(client, buffer)
      end,
    })
    vim.lsp.config("html", {
      filetypes = { "html", "templ", "eruby" },
      capabilities = capabilities,
    })
    vim.lsp.config("dartls", {
      cmd = { "dart", "language-server", "--protocol=lsp" },
      filetypes = { "dart" },
      init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true,
      },
      settings = {
        dart = {
          completeFunctionCalls = true,
          showTodos = true,
        },
      },
      capabilities = capabilities,
    })

    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "⚑",
        },
      },
    })

    vim.opt.signcolumn = "auto"
  end,
}
