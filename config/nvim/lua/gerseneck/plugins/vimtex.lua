return {
  "lervag/vimtex",
  ft = { "tex" },
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = vim.fn.expand("~/.cache/latexmk/aux_files/"),
    }

    local vimtex_autogroup = vim.api.nvim_create_augroup("vimtex", { clear = true })

    vim.api.nvim_create_autocmd("User", {
      pattern = "VimtexEventCompileStopped",
      group = vimtex_autogroup,
      callback = function()
        vim.cmd("silent! VimtexClean")
      end,
    })
  end,
}
