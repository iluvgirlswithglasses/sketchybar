local tokens = require("theme.tokens")
local metrics = require("theme.metrics")
local merge = require("lib.tbl").merge

local M = {}

-- A popup entry with a hover highlight. If `action` (a shell command) is
-- given, clicking the row runs it and closes the popup.
function M.row(parent, name, props, action)
    local row = sbar.add("item", name, merge({
        position = "popup." .. parent.name,
        icon = { padding_left = metrics.space.md },
        label = { padding_right = metrics.space.md },
        background = {
            color = tokens.none,
            corner_radius = metrics.radius.sm,
            height = metrics.height.pill,
        },
    }, props))

    row:subscribe("mouse.entered", function()
        row:set({ background = { color = tokens.surface.hover } })
    end)
    row:subscribe("mouse.exited", function()
        row:set({ background = { color = tokens.none } })
    end)
    if action then
        row:subscribe("mouse.clicked", function()
            sbar.exec(action)
            M.close(parent)
        end)
    end
    return row
end

function M.toggle(parent)
    parent:set({ popup = { drawing = "toggle" } })
end

function M.close(parent)
    parent:set({ popup = { drawing = false } })
end

-- Toggle on click, close when the mouse leaves the popup
function M.attach(parent)
    parent:subscribe("mouse.clicked", function()
        M.toggle(parent)
    end)
    parent:subscribe("mouse.exited.global", function()
        M.close(parent)
    end)
end

return M
