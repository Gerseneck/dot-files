local gh = function(url)
  return "https://github.com/" .. url
end

local plugin_rq = function(file)
  require("gerseneck.plugins." .. file)
end

vim.pack.add({
  -- shared libraries
  { src = gh("nvim-lua/plenary.nvim") },
  { src = gh("nvim-tree/nvim-web-devicons") },

  -- ui
  { src = gh("nanotech/jellybeans.vim") },
  { src = gh("nvim-lualine/lualine.nvim") },

  -- file navigation
  { src = gh("ibhagwan/fzf-lua") },
  { src = gh("nvim-tree/nvim-tree.lua") },

  -- git integration
  { src = gh("tpope/vim-fugitive") },
  { src = gh("lewis6991/gitsigns.nvim") },

  -- quality of life
  { src = gh("kylechui/nvim-surround"), version = vim.version.range("4.x") },
  { src = gh("danymat/neogen") },
  { src = gh("laytan/cloak.nvim") },
  { src = gh("uga-rosa/ccc.nvim") },

  -- nvim-treesitter
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

  -- language server
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("williamboman/mason.nvim") },
  { src = gh("williamboman/mason-lspconfig.nvim") },
  { src = gh("hrsh7th/nvim-cmp") },
  { src = gh("hrsh7th/cmp-buffer") },
  { src = gh("hrsh7th/cmp-path") },
  { src = gh("hrsh7th/cmp-nvim-lsp") },
  { src = gh("hrsh7th/cmp-nvim-lua") },

  -- language specific plugins
  { src = gh("lervag/vimtex") },
})

-- language specific plugins that doesn't need to be loaded immediately
vim.pack.add({
  { src = gh("brianhuster/live-preview.nvim") },
}, { load = function() end })

-- custom user commands for vim.pack
vim.api.nvim_create_user_command("PackAdd", function(opts)
  vim.pack.add(opts.fargs)
end, { nargs = "*", complete = "packadd" })

vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del(opts.fargs)
end, { nargs = "*", complete = "packadd" })

vim.api.nvim_create_user_command("PackUp", function(opts)
  if opts.args ~= "" then
    vim.pack.update(opts.fargs)
  else
    vim.pack.update()
  end
end, { nargs = "*", complete = "packadd" })

-- stylua: ignore start
vim.api.nvim_create_user_command("PackClean", function()
  local unused = vim.iter(vim.pack.get())
    :filter(function(plugin) return not plugin.active end) -- find inactive plugins
    :map(function(plugin) return plugin.spec.name end) -- only get the name
    :totable() -- turn into table

  vim.pack.del(unused)
end, { nargs = 0 })
-- stylua: ignore end

vim.cmd.colorscheme("jellybeans")

plugin_rq("lualine")

plugin_rq("fzf_lua")
plugin_rq("nvim_tree")

plugin_rq("fugitive")
plugin_rq("gitsigns")

plugin_rq("nvim_surround")
plugin_rq("neogen")
plugin_rq("cloak")
plugin_rq("ccc")

plugin_rq("treesitter")

plugin_rq("lsp.lsp_config")
plugin_rq("lsp.cmp")

plugin_rq("vimtex")
