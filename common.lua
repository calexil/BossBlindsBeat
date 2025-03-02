-- description tab loc vars in mods menu
SMODS.current_mod.description_loc_vars = function()
    -- shadow is still awaiting PR as of 2025/02/02, see https://github.com/Steamodded/smods/pull/433
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2, shadow = true }
end

-- add clickable link in description tab
SMODS.current_mod.custom_ui = function(nodes)
    local title, description = unpack(nodes)
    local twitch_deepfind = SMODS.deepfind(description, "twitch.tv/calexil", true)[1]
    if twitch_deepfind then
        -- hacky, maybe there's a better way than this?
        local twitch_link_table = twitch_deepfind.objtree[#twitch_deepfind.objtree-2]
        twitch_link_table.config.button = "go_to_calexil_twitch"
        twitch_link_table.config.tooltip = {text = {localize('b_open_link')}}
    end
end

G.FUNCS.go_to_calexil_twitch = function(e)
    love.system.openURL("https://twitch.tv/calexil")
end

local old_loc_colour = loc_colour
function loc_colour(_c, _default)
    -- hook for custom colours
    local custom_colours = {
        neat_lia = HEX("A7C7E7"),
        neat_lars = HEX("1F62CA")
    }
    if custom_colours[_c] then
        return custom_colours[_c]
    end

    return old_loc_colour(_c, _default)
end
