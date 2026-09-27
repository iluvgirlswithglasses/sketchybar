local tokens = require("theme.tokens")
local metrics = require("theme.metrics")
local merge = require("lib.tbl").merge
local item = require("ui.item")

-- Thin vertical divider between items inside a group
return function(props)
    return item(merge({
        width = 1,
        padding_left = metrics.space.sm,
        padding_right = metrics.space.sm,
        icon = { drawing = false },
        label = { drawing = false },
        background = {
            color = tokens.border.divider,
            height = metrics.height.divider,
            corner_radius = 0,
        },
    }, props))
end
