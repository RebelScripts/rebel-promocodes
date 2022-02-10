local QBCore = exports['qb-core']:GetCoreObject()

local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

local function GiveVehicle(pData, vehicle)
    local cid = pData.PlayerData.citizenid
    local plate = GeneratePlate()
    MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        pData.PlayerData.license,
        cid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        0
    })
end

RegisterNetEvent('rebel-promocodes:server:createpromocode')
AddEventHandler('rebel-promocodes:server:createpromocode', function(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    if args.itemtype == "item" then
        local giveitem = QBCore.Shared.Items[args.item]

        if giveitem == nil then
            giveitem = QBCore.Shared.Items[args.item:lower()]
        end

        if giveitem ~= nil then
            TriggerClientEvent("QBCore:Notify", src, "Succesfully created a promo code for "..args.itemamount.."x "..giveitem['label'], "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`) VALUES (@type, @item, @amount, @code, @admin)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = giveitem['name'],
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name
            })

            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for "..args.itemamount.."x "..giveitem['label'].."\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        else
            TriggerClientEvent("QBCore:Notify", src, "There is no such item!", "error", 3000)
        end
    elseif args.itemtype == "money" then
        if args.item:lower() == "cash" then
            TriggerClientEvent("QBCore:Notify", src, "Succesfully created a promo code for $"..args.itemamount.." Cash", "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`) VALUES (@type, @item, @amount, @code, @admin)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = args.item:lower(),
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name
            })
            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for $"..args.itemamount.." "..args.item.."\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        elseif args.item:lower() == "bank" then
            TriggerClientEvent("QBCore:Notify", src, "Succesfully created a promo code for $"..args.itemamount.." Bank", "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`) VALUES (@type, @item, @amount, @code, @admin)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = args.item:lower(),
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name
            })

            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for $"..args.itemamount.." "..args.item.."\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        end
    elseif args.itemtype == "vehicle" then
        local givevehicle = QBCore.Shared.Vehicles[args.item]

        if givevehicle == nil then
            givevehicle = QBCore.Shared.Vehicles[args.item:lower()]
        end

        if givevehicle ~= nil then
            TriggerClientEvent("QBCore:Notify", src, "Succesfully created a promo code for "..args.itemamount.."x "..givevehicle['name'], "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`) VALUES (@type, @item, @amount, @code, @admin)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = args.item:lower(),
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name
            })

            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for "..args.itemamount.."x "..givevehicle['name'].."\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        else
            TriggerClientEvent("QBCore:Notify", src, "There is no such vehicle", "error", 3000)
        end
    end
end)

QBCore.Commands.Add('redeempromocode', "Redeem a promo code", { {name = 'code', help = 'For example: codegen:wlq129tsd866ofp193lcc683'} }, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    MySQL.Async.fetchAll('SELECT * FROM promocodes WHERE code = ?', {args[1]}, function(result)
        if result[1] then
            if result[1].type == "item" then
                TriggerClientEvent("QBCore:Notify", src, "Succesfully redeemed "..result[1].amount.."x "..QBCore.Shared.Items[result[1].item]['label'], "success", 6000)
                Player.Functions.AddItem(result[1].item, result[1].amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[result[1].item], 'add')
                MySQL.Async.execute('DELETE FROM promocodes WHERE code = ?', {args[1]})
                sendToDiscord(16753920, "Rebel Promo Codes | Code redeemed", Player.PlayerData.name.." redeemed "..result[1].amount.."x "..QBCore.Shared.Items[result[1].item]['label'].."\n\n**Code:** "..args[1].."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "redeemed")
            elseif result[1].type == "money" then
                TriggerClientEvent("QBCore:Notify", src, "Succesfully redeemed $"..result[1].amount.." "..result[1].item, "success", 6000)
                Player.Functions.AddMoney(result[1].item, result[1].amount)
                MySQL.Async.execute('DELETE FROM promocodes WHERE code = ?', {args[1]})
                sendToDiscord(16753920, "Rebel Promo Codes | Code redeemed", Player.PlayerData.name.." redeemed $"..result[1].amount.." "..result[1].item.."\n\n**Code:** "..args[1].."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "redeemed")
            elseif result[1].type == "vehicle" then
                TriggerClientEvent("QBCore:Notify", src, "Succesfully redeemed "..result[1].amount.."x "..QBCore.Shared.Vehicles[result[1].item]['name'], "success", 6000)
                for count = 1, result[1].amount do
                    GiveVehicle(Player, result[1].item)
                end
                MySQL.Async.execute('DELETE FROM promocodes WHERE code = ?', {args[1]})
                sendToDiscord(16753920, "Rebel Promo Codes | Code redeemed", Player.PlayerData.name.." redeemed "..result[1].amount.."x "..QBCore.Shared.Vehicles[result[1].item]['name'].."\n\n**Code:** "..args[1].."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "redeemed")
            end
        else
            TriggerClientEvent("QBCore:Notify", src, "There is no such code!", "error", 3000)
        end
    end)
end)

QBCore.Commands.Add('createpromocode', 'Create a promo code (ADMIN)', {}, true, function(source)
    TriggerClientEvent('rebel-promocodes:client:openpromocodecreator', source)
end, 'admin')

function sendToDiscord(color, name, message, footer, type)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
  
    if type == "created" then
        PerformHttpRequest(Config['Webhooks']['Created_Code'], function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
    elseif type == "redeemed" then
        PerformHttpRequest(Config['Webhooks']['Redeemed_Code'], function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end