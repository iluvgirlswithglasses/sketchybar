-- Semantic color roles.
local p = require("theme.palette")
local alpha = require("lib.color").alpha

return {
    surface = {
        bar = alpha(p.base, 0.9),
        popup = alpha(p.base, 0.9),
    },
    border = {
        bar = p.hl_high,
        popup = p.love,
    },
    fg = {
        primary = p.text,
    },
    accent = p.love,
    none = p.transparent,
}
