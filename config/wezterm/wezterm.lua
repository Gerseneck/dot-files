local wezterm = require("wezterm")

return {
  font = wezterm.font({ family = "JetBrains Mono Nerd Font", weight = "Regular" }),
  font_size = 11,
  harfbuzz_features = { "calt = 0", "clig = 0", "liga = 0" },
  force_reverse_video_cursor = true,
  bold_brightens_ansi_colors = false,
  colors = {
    background = "#1d1f21",
    foreground = "#c5c9c6",
    ansi = {
      "#1d1f21",
      "#db2a21",
      "#219617",
      "#e8cd46",
      "#1d7dcc",
      "#a56bb5",
      "#46a4b0",
      "#a3a6ad"
    },
    brights = {
      "#6b6b6b",
      "#c55555",
      "#79c32c",
      "#feca88",
      "#82b8c8",
      "#c28cb8",
      "#93d3c3",
      "#f8f8f8"
    }
  },
  window_background_opacity = 0.95,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
}
