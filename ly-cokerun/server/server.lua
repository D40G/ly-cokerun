local QBCore = exports['qb-core']:GetCoreObject() 

local Cooldown = false

RegisterServerEvent('ly-cokerun:server:startr', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money['cash'] >= Config.RunCost then
		Player.Functions.RemoveMoney('cash', Config.RunCost)
        Player.Functions.AddItem("casekey", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["casekey"], "add")
		TriggerClientEvent("ly-cokerun:server:runactivate", src)
        TriggerClientEvent('QBCore:Notify', src, Lang:t("success.send_email_right_now"), 'success')
	else
		TriggerClientEvent('QBCore:Notify', source, Lang:t("error.you_dont_have_enough_money"), 'error')
	end
end)

-- cool down for job
RegisterServerEvent('ly-cokerun:server:coolout', function()
    Cooldown = true
    local timer = Config.Cooldown * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            Cooldown = false
        end
    end
end)

QBCore.Functions.CreateCallback("ly-cokerun:server:coolc",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false) 
    end
end)

RegisterServerEvent('ly-cokerun:server:unlock', function ()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem("securitycase", 1)
    Player.Functions.RemoveItem("casekey", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["securitycase"], "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["casekey"], "remove")
end)

RegisterServerEvent('ly-cokerun:server:rewardpayout', function ()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("coke_cured", 20)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coke_cured"], "remove")

    Player.Functions.AddMoney('cash', Config.Payout)

    local chance = math.random(1, 100)

    if chance >= 85 then
        Player.Functions.AddItem(Config.Item, Config.CokeAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Item], "add")
    end

    if chance >= 95 then
        Player.Functions.AddItem(Config.SpecialItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SpecialItem], "add")
    end
end)

RegisterServerEvent('ly-cokerun:server:givecaseitems', function ()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem("coke_cured", 20)
    Player.Functions.RemoveItem("securitycase", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coke_cured"], "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["securitycase"], "remove")
end)
