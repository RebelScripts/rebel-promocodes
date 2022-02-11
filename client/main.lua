local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rebel-promocodes:client:openpromocodecreator', function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Promo Code Creator",
        submitText = "Create",
        inputs = {
            {
                text = "Item Type",
                name = "itemtype", 
                type = "radio",
                options = { 
                    { value = "vehicle", text = "Vehicle" }, 
                    { value = "item", text = "Item" }, 
                    { value = "money", text = "Money" }  
                }
            },
            {
                text = "Item",
                name = "item", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "Amount",
                name = "itemamount",
                type = "number", 
                isRequired = true
            },
            {
                text = "Uses",
                name = "itemuses",
                type = "number", 
                isRequired = true
            }
        }
    })

    if dialog ~= nil then
        TriggerServerEvent("rebel-promocodes:server:createpromocode", dialog)
    end
end)

RegisterNetEvent('rebel-promocodes:client:opengarageselector', function(result, args)
	local option = {}

    if Config.Garage_Version:lower() == "old" then
        for k,v in pairs(Garages) do
            table.insert(option, {
                value = tostring(k), text = v.label
            })
        end
    elseif Config.Garage_Version:lower() == "new" then
        for k,v in pairs(Garages) do
            if (v.type == "public") and (v.vehicle == "car") then
                table.insert(option, {
                    value = tostring(k), text = v.label
                })
            end
        end
    end

    local dialog = exports['qb-input']:ShowInput({
        header = "Code authenticated!<br />Where do you want to store your "..result.amount.."x "..QBCore.Shared.Vehicles[result.item]['name'],
        submitText = "Continue",
        inputs = {
            {
                text = "Select Garage", -- text you want to be displayed as a input header
                name = "selectedgarage", -- name of the input should be unique otherwise it might override
                type = "select", -- type of the input - Select is useful for 3+ amount of "or" options e.g; someselect = none OR other OR other2 OR other3...etc
                options = option
            }
        }
    })

	local args = {
		selectedgarage = dialog,
		result = result,
		args = args
	}

    if dialog ~= nil then
        TriggerServerEvent("rebel-promocodes:server:redeemvehicle", args)
    end
end)
