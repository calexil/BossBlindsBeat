--- Calexil's Boss Blinds Beat for Balatro - Init.lua
--
-- Global values that must be present for the rest of this mod to work.

if not C then CAL = {} end

CAL.BOSS = {
   -- Globals:
   history = {},
   bosses = {},
   latest = {
     boss = 0,
   },
   RECORD_TYPE = {
      BOSS = 0,
   },
   STORAGE_TYPE = {
      BOSS = "boss",
   },
   PATHS = {
      STORAGE = "CALHistory",
   },
}

