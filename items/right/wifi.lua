-- Wi-Fi status icon and LAN address
local tokens = require("theme.tokens")
local metrics = require("theme.metrics")
local fonts = require("theme.fonts")
local icons = require("theme.icons")
local ui = require("ui")

local IFACE = "en0"

local wifi = ui.item("wifi", {
    icon = {
        color = tokens.accent,
        string = icons.wifi.off,
        padding_left = metrics.space.sm,
        padding_right = metrics.space.sm,
    },
    label = {
        font = fonts.get("numeric", "Regular", "md"),
        padding_right = metrics.space.sm,
    },
})

local function update()
    local cmd = "ifconfig " .. IFACE .. " | awk '/status:/{print $2}'; ipconfig getifaddr " .. IFACE
    sbar.exec(cmd, function(out)
        local status, ip = tostring(out):match("(%S*)%s*(%S*)")
        local connected = status == "active" and ip ~= ""
        wifi:set({
            icon = { string = connected and icons.wifi.on or icons.wifi.off },
            label = { string = ip, drawing = connected },
        })
    end)
end

wifi:subscribe({ "wifi_change", "system_woke", "forced" }, update)
update()
