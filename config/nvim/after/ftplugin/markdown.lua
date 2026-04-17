-- load live-preview only when markdown files open
vim.cmd.packadd("live-preview.nvim")

require("livepreview.config").set({
  port = 5500,
  browser = "default",
  dynamic_root = false,
  sync_scroll = true,
  picker = "telescope",
  address = "127.0.0.1",
})

vim.g.localleader = "\\"

vim.keymap.set("n", "<LocalLeader>p", function()
  vim.cmd("LivePreview start")
end)
