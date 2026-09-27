-- Nerd Font glyphs, grouped by domain.
return {
    apple = "",
    dot = "●",
    settings = "\u{F0493}", -- md-cog
    activity = "\u{F0430}", -- md-pulse
    lock = "\u{F033E}", -- md-lock
    volume = {
        high = "\u{F057E}", -- md-volume_high
        medium = "\u{F0580}", -- md-volume_medium
        low = "\u{F057F}", -- md-volume_low
        off = "\u{F0581}", -- md-volume_off
    },
    battery = {
        -- md-battery_10 … md-battery (full), indexed by tens: [1] = 10%, [10] = 100%
        levels = {
            "\u{F007A}", "\u{F007B}", "\u{F007C}", "\u{F007D}", "\u{F007E}",
            "\u{F007F}", "\u{F0080}", "\u{F0081}", "\u{F0082}", "\u{F0079}",
        },
        empty = "\u{F008E}", -- md-battery_outline
        charging = "󱐋",
    },
    wifi = {
        on = "\u{F05A9}", -- md-wifi
        off = "\u{F05AA}", -- md-wifi_off
    },
    media = {
        play = "\u{F040A}", -- md-play
        pause = "\u{F03E4}", -- md-pause
    },
}
