return {
  "tamton-aquib/staline.nvim",
  config = function()
    require("staline").setup({
      mode_colors = {
        n = "#2bbb4f",
        i = "#986fec",
        c = "#e27d60",
        v = "#4799eb",
      }
    })
  end
}
