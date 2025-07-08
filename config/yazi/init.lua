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

Status:children_add(function()
    local h = cx.active.current.hovered
    local elements = {}

    local btime_formatted = nil
    if h and h.cha and h.cha.btime then
        local timestamp_num = tonumber(h.cha.btime)
        if timestamp_num and timestamp_num > 0 then
            btime_formatted = os.date("%Y-%m-%d %H:%M", math.floor(timestamp_num))
        end
    end

    local mtime_formatted = nil
    if h and h.cha and h.cha.mtime then
        local timestamp_num = tonumber(h.cha.mtime)
        if timestamp_num and timestamp_num > 0 then
            mtime_formatted = os.date("%Y-%m-%d %H:%M", math.floor(timestamp_num))
        end
    end

    table.insert(elements, ui.Span("  "))

    if btime_formatted then
        table.insert(elements, ui.Span("B: "):fg("cyan"))
        table.insert(elements, ui.Span(btime_formatted.. " "):fg("blue"))
    end

    table.insert(elements, ui.Span(" "))

    if mtime_formatted then
        table.insert(elements, ui.Span("M: "):fg("cyan"))
        table.insert(elements, ui.Span(mtime_formatted.. " "):fg("blue"))
    end

    return ui.Line(elements)
end, 500, Status.RIGHT)

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
