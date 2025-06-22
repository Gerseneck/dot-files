Header:children_add(function()
  if ya.target_family() ~= "unix" then
    return ""
  end
  return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)

Status:children_add(function(self)
  local h = self._current.hovered
  if h and h.link_to then
    return " -> " .. tostring(h.link_to)
  else
    return ""
  end
end, 3300, Status.LEFT)

th.git = {
  modified = ui.Style():fg("blue"),
  deleted = ui.Style():fg("red"):bold(),

  modified_sign = "[M]",
  added_sign = "[+]",
  untracked_sign = "[?]",
  ignored_sign = "◌",
  deleted_sign = "[✘]",
}

require("git"):setup()

require("full-border"):setup({
  type = ui.Border.ROUNDED,
})

require("copy-file-contents"):setup({
  append_char = "\n",
  notification = true,
})
