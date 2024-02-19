return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" }
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_cmp()

    local cmp = require("cmp")
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp_action.toggle_completion(),
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      select_behavior = "insert",
      preselect = "none",
      completion = {
        completeopt = "menu, menuone, noinsert, noselect"
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "lua_snip" }
      }
    })

    local lua_opts = lsp_zero.nvim_lua_ls()
    require("lspconfig").lua_ls.setup(lua_opts)
  end
}
