--- STEAMODDED HEADER
--- MOD_NAME: Boss Blinds Beat
--- MOD_ID: BossBlindsBeat
--- MOD_AUTHOR: [calexil]
--- MOD_DESCRIPTION: Quickly view your completed boss blinds from the 'Run info' menu.
----------------------------------------------
------------MOD CODE -------------------------


--Store Bosses Beaten--

-- function G.UIDEF.boss_history()
--   CAL.BOSS.view.abs_boss_blind = CAL.BOSS.latest.abs_boss_blind

--- Calexil's Boss Blinds Beat for Balatro - UI/BaseUI.lua
-- The following function is injected into:
--   functions/UI_definitions.lua#G.UIDEF.run_info()
-- see lovely.toml for details.

--Overwrite Current Run Info Tabs--

function CAL.BOSS.bosses_tab()
  return {
     label = "Bosses",
     tab_definition_function = G.UIDEF.bosses,
  }
end



--
-- CUSTOM TOOLTIP:
--

CAL.BOSS._create_tooltip = create_popup_UIBox_tooltip
function create_popup_UIBox_tooltip(tooltip)
   if tooltip.dv == true then
      return {n=G.UIT.ROOT, config = {align = "cm", padding = 0.05, r = 0.1, float = true, shadow = true, colour = lighten(G.C.GREY, 0.6)}, nodes=
                 {{n=G.UIT.C, config={align = "cm", padding = 0.05, r = 0.1, emboss = 0.05, colour = G.C.BLACK}, nodes={tooltip.filler.func(tooltip.filler.args)}}
                 }}
   end
   return CAL.BOSS._create_tooltip(tooltip)
end






























-- function G.UIDEF.run_info()
--     return create_UIBox_generic_options({contents ={create_tabs(
--       {tabs = {
--             {
--               label = localize('b_poker_hands'),
--               chosen = true,
--               tab_definition_function = create_UIBox_current_hands,
--           },
--           {
--             label = localize('b_blinds'),
--             tab_definition_function = G.UIDEF.current_blinds,
--           },
--           {
--               label = localize('b_vouchers'),
--               tab_definition_function = G.UIDEF.used_vouchers,
--           },
--           {
--             label = localize ('b_bosses'),
--             tab_definition_function = G.UIDEF.bosses,
--           },
--           G.GAME.stake > 1 and {
--             label = localize('b_stake'),
--             tab_definition_function = G.UIDEF.current_stake,
--           } or nil,
--       },
--       tab_h = 8,
--       snap_to_nav = true})}})
--   end
  


----------------------------------------------
------------MOD CODE END----------------------