local tokens = require("theme.tokens")
local metrics = require("theme.metrics")

-- Floating, rounded, translucent bar
sbar.bar({
    position = "top",
    topmost = "window",
    sticky = true,
    height = metrics.height.bar,
    margin = metrics.bar.margin,
    y_offset = metrics.bar.y_offset,
    corner_radius = metrics.radius.md,
    padding_left = metrics.bar.padding,
    padding_right = metrics.bar.padding,
    color = tokens.surface.bar,
    border_width = 0,
    border_color = tokens.border.bar,
    shadow = true,
})
