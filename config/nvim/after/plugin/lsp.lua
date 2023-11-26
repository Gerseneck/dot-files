local lsp = require('lsp-zero').preset({name = 'recommended'})

lsp.ensure_installed({
    'pyright',
    'jdtls',
    'ruby_ls',
    'clangd',
    'tsserver',
    'emmet_ls',
    'html',
    'texlab',
})

lsp.setup_nvim_cmp({
    select_behavior = 'insert',
    preselect = 'none',
    completion = {
        completeopt = 'menu, menuone, noinsert, noselect'
    },
})

lsp.on_attach(function(buffer)
    local opts = { buffer = buffer, remap = false }

    vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

