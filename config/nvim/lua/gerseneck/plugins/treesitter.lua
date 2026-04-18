vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    if event.data.spec.name == "nvim-treesitter" then
      if not event.data.active then
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

vim.api.nvim_create_autocmd("BufEnter", {
  group = treesitter_autogroup,
  callback = function(event)
    if not event.buf then
      return
    end

    if not vim.tbl_contains(filetypes, vim.bo[event.buf].filetype) then
      return
    end

    -- hack to make it load after UI renders
    vim.fn.timer_start(0, function()
      vim.treesitter.start()
      vim.bo[event.buf].syntax = "ON"
    end)
  end,
})
