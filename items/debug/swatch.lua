-- Temporary preview of the design tokens and ui components. Remove once real
-- items exist.
local tokens = require("theme.tokens")
local metrics = require("theme.metrics")
local fonts = require("theme.fonts")
local icons = require("theme.icons")
local ui = require("ui")

local M = {}

local function text(name, str, color)
    ui.item("swatch." .. name, {
        icon = { drawing = false },
        label = { string = str, color = color },
    })
end

local function pill(name, str, bg)
    ui.item("swatch." .. name, {
        icon = { drawing = false },
        label = {
            string = str,
            font = fonts.get("numeric", "Bold", "sm"),
            padding_left = metrics.space.md,
            padding_right = metrics.space.md,
        },
        background = {
            color = bg,
            corner_radius = metrics.radius.pill,
            height = metrics.height.pill,
        },
    })
end

-- fg roles, then item surfaces (e.g. workspace pills)
function M.neutrals()
    text("fg.primary", "primary", tokens.fg.primary)
    text("fg.muted", "muted", tokens.fg.muted)
    text("fg.faint", "faint", tokens.fg.faint)
    ui.separator()
    pill("surface.item", "1", tokens.surface.item)
    pill("surface.item_active", "2", tokens.surface.item_active)
end

-- accent, with a demo popup
function M.accent()
    local anchor = ui.item("swatch.accent", {
        icon = { string = icons.apple, color = tokens.accent },
        label = { string = "accent · click me" },
    })
    ui.popup.row(anchor, "swatch.popup.a", { icon = { string = icons.dot }, label = { string = "Popup row" } })
    ui.popup.row(anchor, "swatch.popup.b", { icon = { string = icons.dot }, label = { string = "Hover me" } })
    ui.popup.attach(anchor)
end

-- status roles; returns a mount function for the given roles
function M.status(roles)
    return function()
        for _, role in ipairs(roles) do
            ui.item("swatch.status." .. role, {
                icon = { string = icons.dot, color = tokens.status[role] },
                label = { string = role, font = fonts.get("text", "Semibold", "sm") },
            })
        end
    end
end

return M
