-- Item order and groups for each side of the bar.
-- Right-side items render right-to-left, so they are listed outermost first.
local layout = require("ui.layout")
local swatch = require("items.debug.swatch")

layout("left", {
    { name = "swatch.neutrals", items = { swatch.neutrals } },
})

layout("center", {
    { name = "swatch.accent", items = { swatch.accent } },
})

layout("right", {
    { name = "swatch.critical", items = { swatch.status({ "crit", "info" }) } },
    { name = "swatch.status", items = { swatch.status({ "ok", "warn", "alert" }) } },
})
