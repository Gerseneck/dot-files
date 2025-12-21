vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "lua", "markdown", "dart" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(e)
    local opts = { buffer = e.buffer, remap = false }
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  end
})

vim.api.nvim_create_autocmd("ExitPre", {
  callback = function()
    local project_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml" }, { upward = true })[1])
    local files = { ".project", ".classpath", ".factorypath" }

    if not project_dir then
      return
    end

    for _, filename in pairs(files) do
      local path = vim.fs.joinpath(project_dir, filename)

      if vim.fn.filereadable(path) == 1 then
        os.remove(path)
      end
    end
  end,
})
