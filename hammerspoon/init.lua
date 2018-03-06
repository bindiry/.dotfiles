--- open application
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

hs.hotkey.bind({"alt"}, "E", open("Finder"))
hs.hotkey.bind({"alt"}, "C", open("Google Chrome"))
hs.hotkey.bind({"alt"}, "T", open("iTerm"))
hs.hotkey.bind({"alt"}, "S", open("Sublime Text"))
hs.hotkey.bind({"alt"}, "V", open("Visual Studio Code"))
hs.hotkey.bind({"alt"}, "M", open("NeteaseMusic"))
hs.hotkey.bind({"alt"}, "X", open("Xcode"))
hs.hotkey.bind({"alt"}, "W", open("WeChat"))

--- move windows
function move(dir)
    local counter = {
        right = 0,
        left = 0
    }
    return function()
        counter[dir] = _move(dir, counter[dir])
    end
end

function _move(dir, ct)
    local screenWidth = hs.screen.mainScreen():frame().w
    local focusedWindowFrame = hs.window.focusedWindow():frame()
    local x = focusedWindowFrame.x
    local w = focusedWindowFrame.w
    local value = dir == 'right' and x + w or x
    local valueTarget = dir == 'right' and screenWidth or 0
    if value ~= valueTarget then
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 50])
        return 50
    elseif ct == 50 then
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 70])
        return 70
    elseif ct == 70 then
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 30])
        return 30
    else
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 50])
        return 50
    end
end

hs.window.animationDuration = 0
hs.hotkey.bind({"ctrl", "cmd"}, "Right", move('right'))
hs.hotkey.bind({"ctrl", "cmd"}, "Left", move('left'))

--- sleep
--- hs.hotkey.bind({"control", "alt", "command"}, "DELETE", sleep)
