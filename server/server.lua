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

local function GiveVehicle(pData, vehicle, garage)
    local cid = pData.PlayerData.citizenid
    local plate = GeneratePlate()
    MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        pData.PlayerData.license,
        cid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        garage,
        1
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
            local label = nil

            if tonumber(args.itemuses) == 1 then
                label = "Succesfully created a promo code for "..args.itemamount.."x "..giveitem['label'].." with 1x use"
            else
                label = "Succesfully created a promo code for "..args.itemamount.."x "..giveitem['label'].." with "..args.itemuses.."x uses"
            end

            repeat
                Wait(0)
            until label ~= nil

            TriggerClientEvent("QBCore:Notify", src, label, "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`, `uses`) VALUES (@type, @item, @amount, @code, @admin, @uses)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = giveitem['name'],
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name,
                ['@uses'] = args.itemuses
            })

            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for "..args.itemamount.."x "..giveitem['label'].." with "..args.itemuses.."x uses\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        else
            TriggerClientEvent("QBCore:Notify", src, "There is no such item!", "error", 3000)
        end
    elseif args.itemtype == "money" then
        if args.item:lower() == "cash" then
            local label = nil

            if tonumber(args.itemuses) == 1 then
                label = "Succesfully created a promo code for $"..args.itemamount.." Cash with 1x use"
            else
                label = "Succesfully created a promo code for $"..args.itemamount.." Cash with "..args.itemuses.."x uses"
            end

            repeat
                Wait(0)
            until label ~= nil

            TriggerClientEvent("QBCore:Notify", src, label, "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`, `uses`) VALUES (@type, @item, @amount, @code, @admin, @uses)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = args.item:lower(),
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name,
                ['@uses'] = args.itemuses
            })

            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for $"..args.itemamount.." "..args.item.." with "..args.itemuses.."x uses\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        elseif args.item:lower() == "bank" then
            local label = nil

            if tonumber(args.itemuses) == 1 then
                label = "Succesfully created a promo code for $"..args.itemamount.." Bank with 1x use"
            else
                label = "Succesfully created a promo code for $"..args.itemamount.." Bank with "..args.itemuses.."x uses"
            end

            repeat
                Wait(0)
            until label ~= nil

            TriggerClientEvent("QBCore:Notify", src, label, "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`, `uses`) VALUES (@type, @item, @amount, @code, @admin, @uses)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = args.item:lower(),
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name,
                ['@uses'] = args.itemuses
            })

            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for $"..args.itemamount.." "..args.item.." with "..args.itemuses.."x uses\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        end
    elseif args.itemtype == "vehicle" then
        local givevehicle = QBCore.Shared.Vehicles[args.item]

        if givevehicle == nil then
            givevehicle = QBCore.Shared.Vehicles[args.item:lower()]
        end

        if givevehicle ~= nil then
            local label = nil

            if tonumber(args.itemuses) == 1 then
                label = "Succesfully created a promo code for "..args.itemamount.."x "..givevehicle['name'].." with 1x use"
            else
                label = "Succesfully created a promo code for "..args.itemamount.."x "..givevehicle['name'].." with "..args.itemuses.."x uses"
            end

            repeat
                Wait(0)
            until label ~= nil

            TriggerClientEvent("QBCore:Notify", src, label, "success", 6000)

            local codegen = "codegen:"..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)..string.char(math.random(97, 122))..string.char(math.random(97, 122))..string.char(math.random(97, 122))..math.random(100,999)

            MySQL.Async.insert("INSERT INTO `promocodes` (`type`, `item`, `amount`, `code`, `admin`, `uses`) VALUES (@type, @item, @amount, @code, @admin, @uses)", {
                ['@type'] = args.itemtype:lower(),
                ['@item'] = args.item:lower(),
                ['@amount'] = args.itemamount,
                ['@code'] = tostring(codegen),
                ['@admin'] = Player.PlayerData.name,
                ['@uses'] = args.itemuses
            })
            
            sendToDiscord(16753920, "Rebel Promo Codes | Code created", Player.PlayerData.name.." created a code for "..args.itemamount.."x "..givevehicle['name'].." with "..args.itemuses.."x uses\n\n**Code:** "..tostring(codegen).."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "created")
        else
            TriggerClientEvent("QBCore:Notify", src, "There is no such vehicle", "error", 3000)
        end
    end
end)

QBCore.Commands.Add(Config.Redeem_Code_Command, "Redeem a promo code", { {name = 'code', help = 'For example: codegen:wlq129tsd866ofp193lcc683'} }, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    MySQL.Async.fetchAll('SELECT * FROM promocodes WHERE code = ?', {args[1]}, function(result)
        if result[1] then
            if result[1].type == "item" then
                if result[1].uses >= 1 then
                    local redeemedplayers = result[1].redeemed_players

                    if redeemedplayers == nil then
                        redeemedplayers = {}
                    else
                        redeemedplayers = json.decode(result[1].redeemed_players)
                    end

                    local hasalreadyredeemed = false

                    for k,v in pairs(redeemedplayers) do
                        if Player.PlayerData.citizenid == v.cid then
                            hasalreadyredeemed = true
                        end
                    end

                    if not hasalreadyredeemed then

                        table.insert(redeemedplayers, {
                            cid = Player.PlayerData.citizenid
                        })

                        MySQL.Async.execute('UPDATE promocodes SET redeemed_players = ? WHERE code = ?', {json.encode(redeemedplayers), args[1]})

                        TriggerClientEvent("QBCore:Notify", src, "Succesfully redeemed "..result[1].amount.."x "..QBCore.Shared.Items[result[1].item]['label'], "success", 6000)
                        Player.Functions.AddItem(result[1].item, result[1].amount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[result[1].item], 'add')

                        if result[1].uses == 1 then
                            MySQL.Async.execute('DELETE FROM promocodes WHERE code = ?', {args[1]})
                        else
                            MySQL.Async.execute('UPDATE promocodes SET uses = ? WHERE code = ?', {(result[1].uses - 1), args[1]})
                        end

                        sendToDiscord(16753920, "Rebel Promo Codes | Code redeemed", Player.PlayerData.name.." redeemed "..result[1].amount.."x "..QBCore.Shared.Items[result[1].item]['label'].." with "..args.itemuses.."x uses\n\n**Code:** "..args[1].."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "redeemed")
                    else
                        TriggerClientEvent("QBCore:Notify", src, "You have already redeemed this code...", "error", 6000)
                    end
                end
            elseif result[1].type == "money" then
                if result[1].uses >= 1 then
                    local redeemedplayers = result[1].redeemed_players

                    if redeemedplayers == nil then
                        redeemedplayers = {}
                    else
                        redeemedplayers = json.decode(result[1].redeemed_players)
                    end

                    local hasalreadyredeemed = false

                    for k,v in pairs(redeemedplayers) do
                        if Player.PlayerData.citizenid == v.cid then
                            hasalreadyredeemed = true
                        end
                    end

                    if not hasalreadyredeemed then

                        table.insert(redeemedplayers, {
                            cid = Player.PlayerData.citizenid
                        })

                        MySQL.Async.execute('UPDATE promocodes SET redeemed_players = ? WHERE code = ?', {json.encode(redeemedplayers), args[1]})

                        TriggerClientEvent("QBCore:Notify", src, "Succesfully redeemed $"..result[1].amount.." "..result[1].item, "success", 6000)
                        Player.Functions.AddMoney(result[1].item, result[1].amount)

                        if result[1].uses == 1 then
                            MySQL.Async.execute('DELETE FROM promocodes WHERE code = ?', {args[1]})
                        else
                            MySQL.Async.execute('UPDATE promocodes SET uses = ? WHERE code = ?', {(result[1].uses - 1), args[1]})
                        end

                        sendToDiscord(16753920, "Rebel Promo Codes | Code redeemed", Player.PlayerData.name.." redeemed $"..result[1].amount.." "..result[1].item.."\n\n**Code:** "..args[1].."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "redeemed")
                    else
                        TriggerClientEvent("QBCore:Notify", src, "You have already redeemed this code...", "error", 6000)
                    end
                end
            elseif result[1].type == "vehicle" then
                local redeemedplayers = result[1].redeemed_players

                if redeemedplayers == nil then
                    redeemedplayers = {}
                else
                    redeemedplayers = json.decode(result[1].redeemed_players)
                end

                local hasalreadyredeemed = false

                for k,v in pairs(redeemedplayers) do
                    if Player.PlayerData.citizenid == v.cid then
                         hasalreadyredeemed = true
                    end
                end

                if not hasalreadyredeemed then
                    TriggerClientEvent("rebel-promocodes:client:opengarageselector", source, result[1], args[1])
                else
                    TriggerClientEvent("QBCore:Notify", src, "You have already redeemed this code...", "error", 6000)
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", src, "There is no such code!", "error", 3000)
        end
    end)
end)

QBCore.Commands.Add(Config.Create_Code_Command, 'Create a promo code (ADMIN)', {}, true, function(source)
    TriggerClientEvent('rebel-promocodes:client:openpromocodecreator', source)
end, 'admin')

RegisterNetEvent('rebel-promocodes:server:redeemvehicle')
AddEventHandler('rebel-promocodes:server:redeemvehicle', function(args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    if args.result.uses >= 1 then
        local redeemedplayers = args.result.redeemed_players

        if redeemedplayers == nil then
            redeemedplayers = {}
        else
            redeemedplayers = json.decode(args.result.redeemed_players)
        end

        local hasalreadyredeemed = false

        for k,v in pairs(redeemedplayers) do
            if Player.PlayerData.citizenid == v.cid then
                hasalreadyredeemed = true
            end
        end

        if not hasalreadyredeemed then

            table.insert(redeemedplayers, {
                cid = Player.PlayerData.citizenid
            })

            MySQL.Async.execute('UPDATE promocodes SET redeemed_players = ? WHERE code = ?', {json.encode(redeemedplayers), args.args})

            TriggerClientEvent("QBCore:Notify", src, "Succesfully redeemed "..args.result.amount.."x "..QBCore.Shared.Vehicles[args.result.item]['name'], "success", 6000)
            for count = 1, args.result.amount do
                GiveVehicle(Player, args.result.item, args.selectedgarage.selectedgarage)
            end

            if args.result.uses == 1 then
                MySQL.Async.execute('DELETE FROM promocodes WHERE code = ?', {args.args})
            else
                MySQL.Async.execute('UPDATE promocodes SET uses = ? WHERE code = ?', {(args.result.uses - 1), args.args})
            end

            sendToDiscord(16753920, "Rebel Promo Codes | Code redeemed", Player.PlayerData.name.." redeemed "..args.result.amount.."x "..QBCore.Shared.Vehicles[args.result.item]['name'].."\n\n**Code:** "..args.args.."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by Rebel Scripts", "redeemed")
        else
            TriggerClientEvent("QBCore:Notify", src, "You have already redeemed this code...", "error", 6000)
        end
    end
end)

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
