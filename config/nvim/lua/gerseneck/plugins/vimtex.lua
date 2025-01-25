return {
  "lervag/vimtex",
  ft = { "tex" },
  init = function()
    vim.g.tex_flavor = "latex"

    local vimtex_autogroup = vim.api.nvim_create_augroup("vimtex", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      pattern = "VimtexEventCompileStopped",
      group = vimtex_autogroup,
      callback = function()
        vim.cmd("silent! VimtexClean")
      end
    })
  end
}
