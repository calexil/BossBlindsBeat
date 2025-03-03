--- Calexil's Boss Blinds Beat for Balatro - Init.lua
--
-- Global values that must be present for the rest of this mod to work.

if not C then CAL = {} end

CAL.BOSS = {
   -- TODO:
   history = {},
   view = {
      abs_round = 1,
      text = {" ", " ", " ", " "},
   },
   latest = {
     rel_round = 0,
     abs_round = 0,
     ante = 0,
   },
   RECORD_TYPE = {
      SKIP = 0,
      HAND = 1,
      DISCARD = 2,
      SHOP = 3,
   },
   STORAGE_TYPE = {
      AUTO = "auto",
      MANUAL = "save",
      WIN = "win",
      LOSS = "loss",
   },
   PATHS = {
      STORAGE = "DVHistory",
      AUTOSAVES = "_autosaves",
   },
}

