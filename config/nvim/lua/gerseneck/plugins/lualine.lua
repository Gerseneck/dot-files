local lualine = require("lualine")

local function generate_theme()
  local colors = {
    bg = not vim.api.nvim_get_color_by_name("bg") and "None"
      or string.format("#%06x", vim.api.nvim_get_color_by_name("bg")),
    normal_green = "#2bbb4f",
    insert_purple = "#986fec",
    command_red = "#e27d60",
    visual_blue = "#4799eb",
  }

  local gerseneck_theme = {
    normal = {
      a = { fg = colors.bg, bg = colors.normal_green, gui = "bold" },
      b = { fg = colors.normal_green, bg = colors.bg },
      c = { fg = colors.normal_green, bg = colors.bg },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.insert_purple, gui = "bold" },
      b = { fg = colors.insert_purple, bg = colors.bg },
      c = { fg = colors.insert_purple, bg = colors.bg },
    },
    command = {
      a = { fg = colors.bg, bg = colors.command_red, gui = "bold" },
      b = { fg = colors.command_red, bg = colors.bg },
      c = { fg = colors.command_red, bg = colors.bg },
    },
    visual = {
      a = { fg = colors.bg, bg = colors.visual_blue, gui = "bold" },
      b = { fg = colors.visual_blue, bg = colors.bg },
      c = { fg = colors.visual_blue, bg = colors.bg },
    },
  }

  return gerseneck_theme
end

local sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch" },
  lualine_c = {
    "%=",
    { "filetype", icon_only = true, colored = false, padding = { right = 0 } },
    {
      "filename",
      symbols = { modified = "", readonly = "", unnamed = "[No Name]", newfile = "[New]" },
      padding = { left = 0 },
    },
  },
  lualine_x = {},
  lualine_y = { { "fileformat", padding = { right = 3 } } },
  lualine_z = { "location", "progress" },
}

lualine.setup({
  options = {
    theme = generate_theme(),
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = sections,
  inactive_sections = sections,
  extensions = { "fugitive", "nvim-tree", "quickfix" },
})

local lualine_autogroup = vim.api.nvim_create_augroup("lualine_group", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = lualine_autogroup,
  callback = function()
    lualine.setup({
      options = {
        theme = generate_theme(),
      },
    })
  end,
})
