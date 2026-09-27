-- System icon with a small system menu
local metrics = require("theme.metrics")
local icons = require("theme.icons")
local ui = require("ui")

local logo = ui.item("apple.logo", {
    icon = { drawing = false },
    label = { drawing = false },
    padding_left = metrics.space.sm,
    padding_right = metrics.space.sm,
    background = {
        image = {
            string = os.getenv("CONFIG_DIR") .. "/assets/sakura.png",
            scale = 0.07,
        },
    },
})

local entries = {
    { "settings", icons.settings, "Settings", "open -a 'System Settings'" },
    { "activity", icons.activity, "Activity Monitor", "open -a 'Activity Monitor'" },
    { "lock", icons.lock, "Lock Screen", "pmset displaysleepnow" },
}

for _, e in ipairs(entries) do
    local id, glyph, text, cmd = e[1], e[2], e[3], e[4]
    ui.popup.row(logo, "apple.menu." .. id, {
        icon = { string = glyph },
        label = { string = text },
    }, cmd)
end

ui.popup.attach(logo)
