--- STEAMODDED HEADER
--- MOD_NAME: Boss Blinds Beat
--- MOD_ID: BossBlindsBeat
--- MOD_AUTHOR: [calexil]
--- MOD_DESCRIPTION: Quickly view your completed boss blinds from the run info menu!
----------------------------------------------
------------MOD CODE -------------------------



-- load common util funcs, SMODS UI functions, and the hooks our mod uses
assert(SMODS.load_file("common.lua"))()

-- safe-guard against nested folders (unapplied lovely patches)
local lovely_toml_info = NFS.getInfo(SMODS.current_mod.path .. "lovely.toml")
local lovely_dir_items = NFS.getInfo(SMODS.current_mod.path .. "lovely") and NFS.getDirectoryItems(SMODS.current_mod.path .. "lovely")
local should_have_lovely = lovely_toml_info or (lovely_dir_items and #lovely_dir_items > 0)
if should_have_lovely then
    -- if we have detected a `lovely.toml` file or a non-empty `lovely` directory (assumption that it contains lovely patches)
    assert(SMODS.current_mod.lovely, "Failed to detect ossBlindsBeat lovely patches.\nMake sure your BossBlindsBeat folder is not nested (there should be a bunch of files in the BossBlindseat folder and not just another folder).\n\n\n")
end

-- load all individual bosses
local subdir = "bosses"
local bosses = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(bosses) do
    assert(SMODS.load_file(subdir .. "/" .. filename))()
end
