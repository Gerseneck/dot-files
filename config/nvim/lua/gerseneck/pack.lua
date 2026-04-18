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

  -- nvim-treesitter
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

  -- language specific plugins
  { src = gh("lervag/vimtex") },
})

-- very lazy loading
vim.pack.add({
  -- language server
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("williamboman/mason.nvim") },
  { src = gh("williamboman/mason-lspconfig.nvim") },
  { src = gh("hrsh7th/nvim-cmp") },
  { src = gh("hrsh7th/cmp-buffer") },
  { src = gh("hrsh7th/cmp-path") },
  { src = gh("hrsh7th/cmp-nvim-lsp") },
  { src = gh("hrsh7th/cmp-nvim-lua") },

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

plugin_rq("treesitter")

plugin_rq("vimtex")

local lazy_load = vim.api.nvim_create_augroup("lazy_load", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  group = lazy_load,
  callback = function()
    -- hack to make it load after UI renders
    vim.fn.timer_start(0, function()
      vim.cmd.packadd("nvim-lspconfig")
      vim.cmd.packadd("mason.nvim")
      vim.cmd.packadd("mason-lspconfig.nvim")
      vim.cmd.packadd("nvim-cmp")
      vim.cmd.packadd("cmp-buffer")
      vim.cmd.packadd("cmp-path")
      vim.cmd.packadd("cmp-nvim-lsp")
      vim.cmd.packadd("cmp-nvim-lua")

      plugin_rq("lsp.lsp_config")
      plugin_rq("lsp.cmp")
    end)
  end,
})
