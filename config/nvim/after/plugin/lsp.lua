local lsp = require('lsp-zero').preset({name = 'recommended'})

lsp.ensure_installed({
	'pyright',
	'jdtls',
	'ruby_ls',
	'clangd',
	'tsserver',
	'emmet_ls',
	'html',
})

lsp.setup_nvim_cmp({
	select_behavior = 'insert',
	preselect = 'none',
	completion = {
		completeopt = 'menu, menuone, noinsert, noselect'
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

