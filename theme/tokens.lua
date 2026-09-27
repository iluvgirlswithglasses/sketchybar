-- Semantic color roles.
local p = require("theme.palette")
local alpha = require("lib.color").alpha

return {
    surface = {
        bar = p.transparent,
        group = alpha(p.base, 0.9),
        item_active = p.accent,
        hover = alpha(p.text, 0.08),
        popup = alpha(p.base, 0.9),
    },
    border = {
        group = p.hl_high,
        popup = p.love,
        divider = alpha(p.text, 0.2),
    },
    track = {
        fill = p.text,
        rest = alpha(p.text, 0.2),
    },
    fg = {
        primary = p.text,
        muted = p.subtle,
        faint = p.muted,
    },
    status = {
        ok = p.green,
        warn = p.gold,
        alert = p.orange,
        crit = p.love,
        info = p.pine,
    },
    accent = p.love,
    none = p.transparent,
}
