-- OmniWM backend: workspace state, focus, and a push watcher.
local M = {}

M.event = "omniwm_workspace_changed"

local WATCH = "omniwmctl watch active-workspace,windows-changed --reconnect "
    .. "--exec sketchybar --trigger " .. M.event
local PIDFILE = "/tmp/sketchybar_omniwm_watch.pid"

-- Register the event and (re)start the watcher. The watcher outlives config
-- reloads, so kill the previous one (by pid, only if it is still omniwmctl).
-- --reconnect keeps it alive across WM restarts.
function M.start()
    sbar.add("event", M.event)
    os.execute(
        'pid=$(cat ' .. PIDFILE .. ' 2>/dev/null) && '
            .. 'ps -p "$pid" -o comm= 2>/dev/null | grep -q omniwmctl && kill "$pid"'
    )
    os.execute("(" .. WATCH .. " >/dev/null 2>&1 & echo $! > " .. PIDFILE .. ")")
end

-- isCurrent is the workspace on screen; isFocused only tracks the one holding
-- the focused window, which lags when switching to an empty workspace.
local QUERY = "omniwmctl query workspaces | jq -r "
    .. [['.result.payload.workspaces[] | "\(.rawName) \(.counts.total) \(.isCurrent)"']]

-- cb(state) with state[name] = { occupied = bool, focused = bool }.
-- An empty table means the query failed (e.g. WM restarting).
function M.query(cb)
    sbar.exec(QUERY, function(out)
        local state = {}
        for name, count, focused in tostring(out):gmatch("(%S+) (%d+) (%a+)") do
            state[name] = { occupied = tonumber(count) > 0, focused = focused == "true" }
        end
        cb(state)
    end)
end

function M.focus_cmd(name)
    return 'omniwmctl workspace focus-name "' .. name .. '"'
end

return M
