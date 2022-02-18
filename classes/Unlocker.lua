UT.Unlocker = {}

function UT.Unlocker:toggleDlcUnlocker(value)
    UT.settings.enableDlcUnlocker = value
    UT:saveSettings()
end

function UT.Unlocker:toggleSkinUnlocker(value)
    UT.settings.enableSkinUnlocker = value
    UT:saveSettings()
    if value then
        for skinName, skinData in pairs(tweak_data.blackmarket.weapon_skins) do
            local instanceId = #managers.blackmarket._global.inventory_tradable + 1
            if not managers.blackmarket:have_inventory_tradable_item("weapon_skins", skinName) and not skinData.is_a_color_skin then
                managers.blackmarket:tradable_add_item(instanceId, "weapon_skins", skinName, "mint", false, 1)
            end
        end
    else
        managers.blackmarket._global.inventory_tradable = {}
    end
    UT.Player:refreshAndSave()
end

UTLoadedClassUnlocker = true
