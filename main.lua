--- STEAMODDED HEADER
--- MOD_NAME: Golden Freddy That Really Fucking Hates Talisman
--- MOD_ID: goldenfreddy
--- MOD_AUTHOR: [garb]
--- MOD_DESCRIPTION: Disables Talisman forcefully

----------------------------------------------
------------MOD CODE -------------------------
----------------------------------------------

local mod = SMODS.current_mod
SMODS.Sound({key = "music_goldenfreddy", path = 'music_goldenfreddy.ogg', sync = false, pitch = 1, volume = 0.9, select_music_track = function() return realgoldenfreddy and 1000 end})

local function talisman_jumpscare()
    if next(SMODS.find_mod("Talisman")) then
        local talisman = SMODS.find_mod("Talisman")[1]
        realgoldenfreddy = true
        NFS.write(talisman.path .. '.lovelyignore', '')
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 15, func = function()
        love.event.quit()
        return true end }))
    end
end

local update_ref = Game.update
function Game:update(dt)
    if pseudorandom("penis") < 1/25000 then
        talisman_jumpscare()
    end
    update_ref(self, dt)
end

local _xscale = love.graphics.getWidth() / 1920
local _yscale = love.graphics.getHeight() / 1080

local JOHN_GOLDEN_FREDDY = (mod.path .. "goldenfreddy.png")
JOHN_GOLDEN_FREDDY = assert(NFS.newFileData(JOHN_GOLDEN_FREDDY))
JOHN_GOLDEN_FREDDY = love.graphics.newImage(JOHN_GOLDEN_FREDDY)

local drawhook = love.draw
function love.draw()
    drawhook()
    if realgoldenfreddy then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(JOHN_GOLDEN_FREDDY, 0, 0, 0, _xscale, _yscale)
    end
end