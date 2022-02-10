RegisterNetEvent('rebel-promocodes:client:openpromocodecreator')
AddEventHandler('rebel-promocodes:client:openpromocodecreator', function()
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
                isRequired = false
            }
        }
    })

    if dialog ~= nil then
        TriggerServerEvent("rebel-promocodes:server:createpromocode", dialog)
    end
end)