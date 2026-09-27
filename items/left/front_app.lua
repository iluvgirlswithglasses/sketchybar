-- Name of the focused application
local fonts = require("theme.fonts")
local metrics = require("theme.metrics")
local ui = require("ui")

local app = ui.item("front_app", {
    icon = { drawing = false },
    label = {
        font = fonts.get("text", "Bold", "md"),
        padding_left = metrics.space.md,
        padding_right = metrics.space.md,
    },
})

app:subscribe("front_app_switched", function(env)
    app:set({ label = { string = env.INFO } })
end)

-- front_app_switched only fires on change, so seed the initial value
sbar.exec("lsappinfo info -only name \"$(lsappinfo front)\"", function(out)
    local name = tostring(out):match('"LSDisplayName"="(.-)"')
    if name then
        app:set({ label = { string = name } })
    end
end)
