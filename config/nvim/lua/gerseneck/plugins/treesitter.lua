vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

local treesitter = require("nvim-treesitter")

local parsers = {
  "vimdoc",
  "python",
  "java",
  "ruby",
  "lua",
  "typescript",
  "javascript",
  "markdown",
  "latex",
}

treesitter.install(parsers)

-- filetypes might have different names than parsers
local filetypes = {
  "help",
  "python",
  "java",
  "ruby",
  "lua",
  "typescript",
  "javascript",
  "markdown",
  "latex",
}

local treesitter_autogroup = vim.api.nvim_create_augroup("treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  group = treesitter_autogroup,
  callback = function()
    vim.treesitter.start()
  end,
})
