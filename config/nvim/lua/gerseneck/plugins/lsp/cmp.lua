local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-N>"] = cmp.mapping.select_next_item(),
    ["<C-P>"] = cmp.mapping.select_prev_item(),
  }),
  select_behavior = "insert",
  preselect = "none",
  completion = {
    completeopt = "menu, menuone, noinsert, noselect",
  },
  sources = {
    {
      name = "path",
      options = {
        trailing_slash = true,
      },
    },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
  },
})
