local modPath = ModPath

dofile(modPath .. "classes/UT.lua")
dofile(modPath .. "classes/Utils.lua")

UT:loadSettings()

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_UltimateTrainer", function(localizationManager)
    localizationManager:load_localization_file(modPath .. "locales/en.json")
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_UltimateTrainer", function(menuManager)
    MenuCallbackHandler.ut_set_level = function(self, item)
        local level = item:value()
        item:set_value("")
        if UT.Utils:isEmptyString(level) then
            return
        end
        level = UT.Utils:toNumber(level)
        if not UT.Utils:isInteger(level) then
            return
        end
        if level < 0 or level > 100 then
            return
        end
        UT.Player:setLevel(level)
        UT:addAlert("ut_alert_level_set", UT.colors.success)
    end

    MenuCallbackHandler.ut_set_infamy_rank = function(self, item)
        local infamyRank = item:value()
        item:set_value("")
        if UT.Utils:isEmptyString(infamyRank) then
            return
        end
        infamyRank = UT.Utils:toNumber(infamyRank)
        if not UT.Utils:isInteger(infamyRank) then
            return
        end
        if infamyRank < 0 or infamyRank > 500 then
            return
        end
        UT.Player:setInfamyRank(infamyRank)
        UT:addAlert("ut_alert_infamy_rank_set", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_spending_money = function(self, item)
        local amount = item:value()
        item:set_value("")
        if UT.Utils:isEmptyString(amount) then
            return
        end
        amount = UT.Utils:toNumber(amount)
        if not UT.Utils:isInteger(amount) then
            return
        end
        if amount < 0 then
            return
        end
        UT.Player:addSpendingMoney(amount)
        UT:addAlert("ut_alert_spending_money_added", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_offshore_money = function(self, item)
        local amount = item:value()
        item:set_value("")
        if UT.Utils:isEmptyString(amount) then
            return
        end
        amount = UT.Utils:toNumber(amount)
        if not UT.Utils:isInteger(amount) then
            return
        end
        if amount < 0 then
            return
        end
        UT.Player:addOffshoreMoney(amount)
        UT:addAlert("ut_alert_offshore_money_added", UT.colors.success)
    end

    MenuCallbackHandler.ut_reset_money = function(self, item)
        UT.Player:resetMoney()
        UT:addAlert("ut_alert_money_reset", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_continental_coins = function(self, item)
        local amount = item:value()
        item:set_value("")
        if UT.Utils:isEmptyString(amount) then
            return
        end
        amount = UT.Utils:toNumber(amount)
        if not UT.Utils:isInteger(amount) then
            return
        end
        if amount < 0 then
            return
        end
        UT.Player:addContinentalCoins(amount)
        UT:addAlert("ut_alert_continental_coins_added", UT.colors.success)
    end

    MenuCallbackHandler.ut_reset_continental_coins = function(self, item)
        UT.Player:resetContinentalCoins()
        UT:addAlert("ut_alert_continental_coins_reset", UT.colors.success)
    end

    MenuCallbackHandler.ut_toggle_skill_points_hack = function(self, item)
        local value = UT.Utils:getToggleValue(item:value())
        UT.Player:toggleSkillPointsHack(value)
        if value then
            UT:addAlert("ut_alert_skill_points_hack_enabled", UT.colors.success)
        else
            UT:addAlert("ut_alert_skill_points_hack_disabled", UT.colors.success)
        end
    end

    MenuCallbackHandler.ut_set_skill_points_total_amount = function(self, item)
        local amount = item:value()
        if UT.Utils:isEmptyString(amount) then
            return
        end
        amount = UT.Utils:toNumber(amount)
        if not UT.Utils:isInteger(amount) then
            return
        end
        if amount < 0 or amount > 690 then
            return
        end
        UT.Player:setSkillPointsTotalAmount(amount)
        UT:addAlert("ut_alert_skill_points_total_amount_set", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_perk_experience = function(self, item)
        local amount = item:value()
        item:set_value("")
        if UT.Utils:isEmptyString(amount) then
            return
        end
        amount = UT.Utils:toNumber(amount)
        if not UT.Utils:isInteger(amount) then
            return
        end
        if amount < 0 then
            return
        end
        UT.Player:addPerkPoints(amount)
        UT:addAlert("ut_alert_perk_experience_added", UT.colors.success)
    end

    MenuCallbackHandler.ut_reset_perk_points = function(self, item)
        UT.Player:resetPerkPoints()
        UT:addAlert("ut_alert_perk_points_reset", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_one_of_all_weapon_mods = function(self, item)
        UT.Player:addItemsToInventory("weapon_mods")
        UT:addAlert("ut_alert_added_one_of_all_weapon_mods", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_one_of_all_masks = function(self, item)
        UT.Player:addItemsToInventory("masks")
        UT:addAlert("ut_alert_added_one_of_all_masks", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_one_of_all_materials = function(self, item)
        UT.Player:addItemsToInventory("materials")
        UT:addAlert("ut_alert_added_one_of_all_materials", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_one_of_all_patterns = function(self, item)
        UT.Player:addItemsToInventory("textures")
        UT:addAlert("ut_alert_added_one_of_all_patterns", UT.colors.success)
    end

    MenuCallbackHandler.ut_add_one_of_all_colors = function(self, item)
        UT.Player:addItemsToInventory("colors")
        UT:addAlert("ut_alert_added_one_of_all_colors", UT.colors.success)
    end

    MenuCallbackHandler.ut_clear_weapon_mods = function(self, item)
        UT.Player:clearInventoryItems("weapon_mods")
        UT:addAlert("ut_alert_weapon_mods_cleared", UT.colors.success)
    end

    MenuCallbackHandler.ut_clear_masks = function(self, item)
        UT.Player:clearInventoryItems("masks")
        UT:addAlert("ut_alert_masks_cleared", UT.colors.success)
    end

    MenuCallbackHandler.ut_clear_materials = function(self, item)
        UT.Player:clearInventoryItems("materials")
        UT:addAlert("ut_alert_materials_cleared", UT.colors.success)
    end

    MenuCallbackHandler.ut_clear_patterns = function(self, item)
        UT.Player:clearInventoryItems("textures")
        UT:addAlert("ut_alert_patterns_cleared", UT.colors.success)
    end

    MenuCallbackHandler.ut_clear_colors = function(self, item)
        UT.Player:clearInventoryItems("colors")
        UT:addAlert("ut_alert_colors_cleared", UT.colors.success)
    end

    MenuCallbackHandler.ut_unlock_all_weapons = function(self, item)
        UT.Player:unlockInventoryCategory("weapon")
        UT:addAlert("ut_alert_unlocked_all_weapons", UT.colors.success)
    end

    MenuCallbackHandler.ut_unlock_all_melee_weapons = function(self, item)
        UT.Player:unlockInventoryCategory("melee_weapon")
        UT:addAlert("ut_alert_unlocked_all_melee_weapons", UT.colors.success)
    end

    MenuCallbackHandler.ut_unlock_all_throwables = function(self, item)
        UT.Player:unlockInventoryCategory("grenade")
        UT:addAlert("ut_alert_unlocked_all_throwables", UT.colors.success)
    end

    MenuCallbackHandler.ut_unlock_all_armors = function(self, item)
        UT.Player:unlockInventoryCategory("armor")
        UT:addAlert("ut_alert_unlocked_all_armors", UT.colors.success)
    end

    MenuCallbackHandler.ut_remove_exclamation_marks = function(self, item)
        UT.Player:removeExclamationMarks()
        UT:addAlert("ut_alert_exclamation_marks_removed", UT.colors.success)
    end

    MenuCallbackHandler.ut_unlock_all_slots = function(self, item)
        UT.Player:setAllSlots(true)
        UT:addAlert("ut_alert_unlocked_all_slots", UT.colors.success)
    end

    MenuCallbackHandler.ut_lock_all_slots = function(self, item)
        UT.Player:setAllSlots(false)
        UT:addAlert("ut_alert_locked_all_slots", UT.colors.success)
    end

    MenuCallbackHandler.ut_unlock_all_trophies = function(self, item)
        UT.Player:unlockAllTrophies()
        UT:addAlert("ut_alert_unlocked_all_trophies", UT.colors.success)
    end

    MenuCallbackHandler.ut_lock_all_trophies = function(self, item)
        UT.Player:lockAllTrophies()
        UT:addAlert("ut_alert_locked_all_trophies", UT.colors.success)
    end

    MenuCallbackHandler.ut_unlock_all_steam_achievements = function(self, item)
        UT.Player:unlockAllSteamAchievements()
        UT:addAlert("ut_alert_unlocked_all_steam_achievements", UT.colors.success)
    end

    MenuCallbackHandler.ut_lock_all_steam_achievements = function(self, item)
        UT.Player:lockAllSteamAchievements()
        UT:addAlert("ut_alert_locked_all_steam_achievements", UT.colors.success)
    end

    MenuCallbackHandler.ut_toggle_dlc_unlocker = function(self, item)
        local value = UT.Utils:getToggleValue(item:value())
        UT.Unlocker:toggleDlcUnlocker(value)
        if value then
            UT:addAlert("ut_alert_dlc_unlocker_enabled", UT.colors.success)
        else
            UT:addAlert("ut_alert_dlc_unlocker_disabled", UT.colors.success)
        end
    end

    MenuCallbackHandler.ut_toggle_skin_unlocker = function(self, item)
        local value = UT.Utils:getToggleValue(item:value())
        UT.Unlocker:toggleSkinUnlocker(value)
        if value then
            UT:addAlert("ut_alert_skin_unlocker_enabled", UT.colors.success)
        else
            UT:addAlert("ut_alert_skin_unlocker_disabled", UT.colors.success)
        end
    end

    MenuHelper:LoadFromJsonFile(modPath .. "menus/main.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/player.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/unlocker.json", nil, UT.settings)
    
    MenuHelper:LoadFromJsonFile(modPath .. "menus/level.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/infamy-rank.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/money.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/continental-coins.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/skill-points.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/perk-points.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/inventory.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/trophies.json", nil, UT.settings)
    MenuHelper:LoadFromJsonFile(modPath .. "menus/steam-achievements.json", nil, UT.settings)
end)