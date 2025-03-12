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
     tab_definition_function = G.UIDEF.settings_tab,
  }
end

----------------------------------------------
------------MOD CODE END----------------------
