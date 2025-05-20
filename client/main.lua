ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

local inRadialMenu = false
local IsDown = false

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer) ESX.PlayerData = xPlayer end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job) ESX.PlayerData.job = job end)

RegisterNetEvent('esx_ambulancejob:revive', function(pw)
    IsDown = false
end)

RegisterCommand('_rad', function()
    if not IsPauseMenuActive() and not inRadialMenu then
        openRadial(true)
        SetCursorLocation(0.5, 0.5)
    end
end)

RegisterKeyMapping('_rad', 'Open Radial Menu', 'keyboard', 'OEM_3')

local function IsPolice()
    return (ESX.PlayerData.job.name == "police" or ESX.PlayerData.job.name == "sheriff")
end

AddEventHandler('esx:onPlayerDeath', function(reason)
	IsDown = true
end)

local ofcDownAdded = false

function setupSubItems()

    PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == 'sheriff' then
        PlayerData.job.name = 'police'
    end

    if (IsDown and IsPolice()) then
        if not ofcDownAdded then
            temptable = {
                id = 'officerdown',
                title = '10-999',
                icon = 'sad-cry',
                type = 'client',
                event = 'pb-police:ofcdown',
                shouldClose = true,
            }
            table.insert(Config.MenuItems, temptable)
            ofcDownAdded = true
        end
        -- print('ofc down')
    else
        if ofcDownAdded then
            for k,v in pairs(Config.MenuItems) do
                if v.id == 'officerdown' then
                    table.remove(Config.MenuItems, k)
                    ofcDownAdded = false
                    break
                end
            end
        end
        -- print('not down or police')
    end

    if Config.JobInteractions[PlayerData.job.name] ~= nil and next(Config.JobInteractions[PlayerData.job.name]) ~= nil then
        Config.MenuItems[4].items = Config.JobInteractions[PlayerData.job.name]
    else 
        Config.MenuItems[4].items = {}
    end

    local Vehicle = GetVehiclePedIsIn(PlayerPedId())

    if Vehicle ~= nil or Vehicle ~= 0 then
        local AmountOfSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Vehicle))

        if AmountOfSeats == 2 then
            Config.MenuItems[3].items[2].items = {
                [1] = {
                    id    = -1,
                    title = 'Fahrersitz',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id    = 0,
                    title = 'Beifahrersitz',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 3 then
            Config.MenuItems[3].items[2].items = {
                [4] = {
                    id    = -1,
                    title = 'Fahrersitz',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id    = 0,
                    title = 'Beifahrersitz',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id    = 1,
                    title = 'Other',
                    icon = 'caret-down',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 4 then
            Config.MenuItems[3].items[2].items = {
                [4] = {
                    id    = -1,
                    title = 'Fahrersitz',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id    = 0,
                    title = 'Beifahrersitz',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id    = 1,
                    title = 'Linker Rücksitz',
                    icon = 'caret-down',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id    = 2,
                    title = 'Rechter Rücksitz',
                    icon = 'caret-down',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        end
    end
end

function openRadial(bool)    
    setupSubItems()

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = Config.MenuItems
    })
    inRadialMenu = bool
end

function closeRadial(bool)    
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData

    if itemData.type == 'client' then
        -- Sonderbehandlung für jsfour-idcard
        if itemData.event == 'wallet:showID' then
            TriggerEvent('jsfour-idcard:open', 'id', true)
        elseif itemData.event == 'wallet:showDriverLicense' then
            TriggerEvent('jsfour-idcard:open', 'driver', true)
        elseif itemData.event == 'wallet:showGunLicense' then
            TriggerEvent('jsfour-idcard:open', 'weapon', true)
        elseif itemData.event == 'wallet:showHuntLicense' then
            -- jsfour-idcard kennt keinen Jagdschein → dupliziere Waffenschein oder erweitere das Script
            TriggerEvent('jsfour-idcard:open', 'weapon', false)
        elseif itemData.event == 'wallet:viewID' then
            TriggerEvent('jsfour-idcard:open', 'id', false)
        elseif itemData.event == 'wallet:viewDriverLicense' then
            TriggerEvent('jsfour-idcard:open', 'driver', false)
        elseif itemData.event == 'wallet:viewGunLicense' then
            TriggerEvent('jsfour-idcard:open', 'weapon', false)
        else
            TriggerEvent(itemData.event, itemData)
        end
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    elseif itemData.type == 'cmd' then
        ExecuteCommand(itemData.event)
    end
end)


RegisterNetEvent('qb-radialmenu:client:noPlayers')
AddEventHandler('qb-radialmenu:client:noPlayers', function(data)
    --QBCore.Functions.Notify('There arrent any people close', 'error', 2500)
	exports['Nico_Notify']:Alert('inform', 'Es ist niemand in der Nähe', 10000, 'error', true)
end)

RegisterNetEvent('qb-radialmenu:client:giveidkaart')
AddEventHandler('qb-radialmenu:client:giveidkaart', function(data)
    -- ??
end)

RegisterNetEvent('qb-radialmenu:client:setExtra')
AddEventHandler('qb-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    local enginehealth = 1000.0
    local bodydamage = 1000.0

    if veh ~= nil then
        local plate = GetVehicleNumberPlateText(veh)
    
        if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            if DoesExtraExist(veh, extra) then 
                if IsVehicleExtraTurnedOn(veh, extra) then
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 1)
                    SetVehicleEngineHealth(veh, enginehealth)
                    SetVehicleBodyHealth(veh, bodydamage)
                    --QBCore.Functions.Notify('Extra ' .. extra .. ' Deactivated', 'error', 2500)
                    exports['Nico_Notify']:SendAlert('error', 'Extra ' .. extra .. ' Deactivated')
                else
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 0)
                    SetVehicleEngineHealth(veh, enginehealth)
                    SetVehicleBodyHealth(veh, bodydamage)
                    --QBCore.Functions.Notify('Extra ' .. extra .. ' Activated', 'success', 2500)
                    exports['Nico_Notify']:SendAlert('success', 'Extra ' .. extra .. ' Activated')
                end    
            else
                --QBCore.Functions.Notify('Extra ' .. extra .. ' Its not pressent on this vehicle ', 'error', 2500)
                exports['Nico_Notify']:SendAlert('error', 'Extra ' .. extra .. ' is not possible for this vehicle')
            end
        else
            --QBCore.Functions.Notify('Your not a driver of a vehicle !', 'error', 2500)
			exports['Nico_Notify']:Alert('error', 'Du bist nicht der Besitzer des Fahrzeugs', 10000, 'error', true)
        end
    end
end)

RegisterNetEvent('qb-radialmenu:trunk:client:Door')
AddEventHandler('qb-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= 0 then
        local pl = GetVehicleNumberPlateText(veh)

        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

local Seats = {
    ["-1"] = "Fahrersitz",
    ["0"] = "Beifahrersitz",
    ["1"] = "Linker Rücksitz",
    ["2"] = "Rechter Rücksitz",
}

RegisterNetEvent('qb-radialmenu:client:ChangeSeat')
AddEventHandler('qb-radialmenu:client:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local IsSeatFree = IsVehicleSeatFree(Veh, data.id)
    local speed = GetEntitySpeed(Veh)
    -- local HasHarnass = exports['qb-smallresources']:HasHarness()
    -- if not HasHarnass then
        local kmh = (speed * 3.6);  

        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(PlayerPedId(), Veh, data.id)
                --QBCore.Functions.Notify('Your now on the  '..data.title..'!')
				exports['Nico_Notify']:Alert('Info', 'Du bist nun auf dem '..data.title..'!', 10000, 'warning', true)
            else
                --QBCore.Functions.Notify('The vehicle goes to fast..')
				exports['Nico_Notify']:Alert('Info', 'Das Fahrzeug fährt zu schnell.', 10000, 'warning', true)
            end
        else
            --QBCore.Functions.Notify('This seat is occupied..')
			exports['Nico_Notify']:Alert('Info', 'Dieser Platz ist besetzt.', 10000, 'warning', true)
        end
    -- else
        --QBCore.Functions.Notify('You have a race harnas on u cant switch..', 'error')
		--exports['Nico_Notify']:Alert('Error', 'You have a race harnas on u cant switch..', 10000, 'error', true)
    -- end
end)

RegisterNetEvent('custom:radialmenu:toggleWindow')
AddEventHandler('custom:radialmenu:toggleWindow', function(data)
    -- id ist z. B. "window0", "window1", ...
    local idString = data.id
    local index = tonumber(idString:match("%d+")) -- extrahiere die Zahl aus "window0" → 0

    if index == nil then
        print("Fehler: Kein gültiger Fenster-Index in id:", idString)
        return
    end

    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle and vehicle ~= 0 then
        if IsVehicleWindowIntact(vehicle, index) then
            RollDownWindow(vehicle, index)
        else
            RollUpWindow(vehicle, index)
        end
    else
        exports['Nico_Notify']:Alert('Fehler', 'Kein Fahrzeug gefunden.', 5000, 'error', true)
    end
end)

RegisterNetEvent('custom:radialmenu:toggleDoor')
AddEventHandler('custom:radialmenu:toggleDoor', function(data)
	local door = tonumber(data.id:match("%d+")) -- aus z.B. "door2" wird 2
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(ped, false)

	if vehicle and vehicle ~= 0 then
		if GetVehicleDoorAngleRatio(vehicle, door) > 0.1 then
			SetVehicleDoorShut(vehicle, door, false)
		else
			SetVehicleDoorOpen(vehicle, door, false, false)
		end
	else
		exports['Nico_Notify']:Alert("Fehler", "Kein Fahrzeug gefunden", 5000, "error", true)
	end
end)

RegisterNetEvent('custom:radialmenu:toggleAllDoors')
AddEventHandler('custom:radialmenu:toggleAllDoors', function()
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(ped, false)

	if vehicle and vehicle ~= 0 then
		local anyOpen = false

		-- Prüfe, ob eine der Türen offen ist
		for i = 0, 5 do
			if DoesVehicleHaveDoor(vehicle, i) and GetVehicleDoorAngleRatio(vehicle, i) > 0.1 then
				anyOpen = true
				break
			end
		end

		-- Öffne oder schließe alle gültigen Türen
		for i = 0, 5 do
			if DoesVehicleHaveDoor(vehicle, i) then
				if anyOpen then
					SetVehicleDoorShut(vehicle, i, false)
				else
					SetVehicleDoorOpen(vehicle, i, false, false)
				end
			end
		end

		exports['Nico_Notify']:Alert("Info", anyOpen and "Alle Türen geschlossen" or "Alle Türen geöffnet", 5000, "info", true)
	else
		exports['Nico_Notify']:Alert("Fehler", "Du bist in keinem Fahrzeug", 5000, "error", true)
	end
end)

RegisterNetEvent('radialmenu:action')
AddEventHandler('radialmenu:action', function(action)
    local playerPed = PlayerPedId()

    if action == 'id_card' then
        TriggerServerEvent('radialmenu:showID', GetPlayerServerId(PlayerId()))
    elseif action == 'id_self' then
        TriggerServerEvent('radialmenu:showID', nil) -- Eigene ID anschauen
    elseif action == 'release' then
        TriggerServerEvent('radialmenu:releasePlayer')
    elseif action == 'carry' then
        TriggerServerEvent('radialmenu:carryPlayer')
    elseif action == 'search' then
        TriggerServerEvent('radialmenu:searchPlayer')
    end
end)

RegisterNetEvent('wallet:viewDocument')
AddEventHandler('wallet:viewDocument', function(docType)
    TriggerServerEvent('jsfour-idcard:getSelfData', docType)
end)


function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end