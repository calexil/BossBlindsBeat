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

--Structure--
-- node > MAIN
-- nodes ={
--   {n=G.UIT.T, config={text = "Bosses Completed", colour = G.C.UI.TEXT_LIGHT, ...}}
-- }
--Overwrite Current Run Info Tabs--

CAL.BOSS.bosses_tab = function ()
  cal_nodes = {{n=G.UIT.R, config={align = "tm"}, nodes={
    {n=G.UIT.O, config={object = DynaText({string = "Bosses Completed", colour = G.C.UI.TEXT_LIGHT, shadow = true, scale = 0.4})}}
  }}
  }
  return {
  n = G.UIT.ROOT,
  config = {
      emboss = 0.05,
      minh = 6,
      r = 0.1,
      minw = 10,
      align = "cm",
      padding = 0.2,
      colour = G.C.BLACK
  },
  nodes = cal_nodes
}
end

function CAL.BOSS.bosses_tab()
  return {
     label = "Bosses",
     tab_definition_function = CAL.BOSS.bosses_tab,
  }

end

----------------------------------------
------------MOD CODE END----------------------
