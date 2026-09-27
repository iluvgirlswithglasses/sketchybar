return {
    space = { xs = 2, sm = 4, md = 8, lg = 12, xl = 16 },
    radius = { sm = 6, md = 9, pill = 15 },
    height = { bar = 38, group = 30, pill = 24, divider = 14 },

    bar = {
        margin = 10,
        y_offset = 0,
        padding = 0,
    },
    group = {
        blur = 20,
        border_width = 0,
        padding = 4, -- inner space between the pill edge and its first/last item
        gap = 8, -- space between neighbouring groups
    },
    popup = {
        blur = 20,
        border_width = 2,
    },
    motion = {
        curve = "tanh",
        fast = 8,
        slow = 20,
    },
}
