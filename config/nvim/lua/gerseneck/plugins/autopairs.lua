return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      enable_check_bracket_line = false,
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", "'", '"' },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        before_key = "h",
        after_key = "l",
        cursor_pos_before = true,
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        manual_position = true,
        highlight = "Search",
        highlight_grey = "Comment"
      }
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )
  end
}
