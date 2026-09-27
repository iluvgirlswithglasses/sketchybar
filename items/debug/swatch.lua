-- Temporary center placeholder: accent color and a demo popup. Remove once
-- the center is decided.
local tokens = require("theme.tokens")
local icons = require("theme.icons")
local ui = require("ui")

local M = {}

function M.accent()
    local anchor = ui.item("swatch.accent", {
        icon = { string = icons.apple, color = tokens.accent },
        label = { string = "accent · click me" },
    })
    ui.popup.row(anchor, "swatch.popup.a", { icon = { string = icons.dot }, label = { string = "Popup row" } }, "true")
    ui.popup.row(anchor, "swatch.popup.b", { icon = { string = icons.dot }, label = { string = "Hover me" } }, "true")
    ui.popup.attach(anchor)
end

return M
