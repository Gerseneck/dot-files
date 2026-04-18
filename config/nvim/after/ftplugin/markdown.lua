vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- load live-preview only when markdown files open
vim.cmd.packadd("live-preview.nvim")

local livepreview = require("livepreview")

require("livepreview.config").set({
  port = 5500,
  browser = "default",
  dynamic_root = false,
  sync_scroll = true,
  picker = "fzf-lua",
  address = "127.0.0.1",
})

vim.g.localleader = "\\"

vim.keymap.set("n", "<LocalLeader>p", function()
  if livepreview.is_running() then
    vim.cmd("LivePreview close")
  else
    vim.cmd("LivePreview start")
  end
end)
