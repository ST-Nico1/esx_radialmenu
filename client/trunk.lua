local inTrunk = false
local isKidnapped = false
local isKidnapping = false

local disabledTrunk = {
    [1] = "penetrator",
    [2] = "vacca",
    [3] = "monroe",
    [4] = "turismor",
    [5] = "osiris",
    [6] = "comet",
    [7] = "ardent",
    [8] = "jester",
    [9] = "nero",
    [10] = "nero2",
    [11] = "vagner",
    [12] = "infernus",
    [13] = "zentorno",
    [14] = "comet2",
    [15] = "comet3",
    [16] = "comet4",
    [17] = "lp700r",
    [18] = "r8ppi",
    [19] = "911turbos",
    [20] = "rx7rb",
    [21] = "fnfrx7",
    [22] = "delsoleg",
    [23] = "s15rb",
    [24] = "gtr",
    [25] = "fnf4r34",
    [26] = "ap2",
    [27] = "bullet",
}

function loadDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end

function disabledCarCheck(veh)
    for i=1,#disabledTrunk do
        if GetEntityModel(veh) == GetHashKey(disabledTrunk[i]) then
            return true
        end
    end
    return false
end

RegisterNetEvent('qb-kidnapping:client:SetKidnapping')
AddEventHandler('qb-kidnapping:client:SetKidnapping', function(bool)
    isKidnapping = bool
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

local cam = nil

function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

function TrunkCam(bool)
    local ped = PlayerPedId()
    local vehicle = GetEntityAttachedTo(PlayerPedId())
    local drawPos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -5.5, 0)

    local vehHeading = GetEntityHeading(vehicle)

    if bool then
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(cam, false)
        if not DoesCamExist(cam) then
            cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
            SetCamActive(cam, true)
            SetCamCoord(cam, drawPos.x, drawPos.y, drawPos.z + 2)
            SetCamRot(cam, -2.5, 0.0, vehHeading, 0.0)
            RenderScriptCams(true, false, 0, true, true)
        end
    else
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(cam, false)
        cam = nil
    end
end

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local vehicle = GetEntityAttachedTo(PlayerPedId())
        local drawPos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -5.5, 0)
    
        local vehHeading = GetEntityHeading(vehicle)

        if cam ~= nil then
            SetCamRot(cam, -2.5, 0.0, vehHeading, 0.0)
            SetCamCoord(cam, drawPos.x, drawPos.y, drawPos.z + 2)
        else
            Citizen.Wait(1000)
        end

        Citizen.Wait(1)
    end
end)

RegisterNetEvent('qb-trunk:client:KidnapTrunk')
AddEventHandler('qb-trunk:client:KidnapTrunk', function()
    closestPlayer, distance = ESX.Game.GetClosestPlayer()
    local closestPlayerPed = GetPlayerPed(closestPlayer)
    if (distance ~= -1 and distance < 2) then
        if isKidnapping then
            local closestVehicle = getNearestVeh()
            if closestVehicle ~= 0 then
                TriggerEvent('police:client:KidnapPlayer')
                TriggerServerEvent("police:server:CuffPlayer", GetPlayerServerId(closestPlayer), false)
                Citizen.Wait(50)
                TriggerServerEvent("qb-trunk:server:KidnapTrunk", GetPlayerServerId(closestPlayer), closestVehicle)
            end
        else
            --QBCore.Functions.Notify('You did not kipnap this person!', 'error')
            --exports['mythic_notify']:SendAlert('error', 'You did not kipnap this person!')
			exports['Nico_Notify']:Alert('Info', 'Du hast diese Person nicht gekidnappt!', 10000, 'error', true)
        end
    end
end)

RegisterNetEvent('qb-trunk:client:KidnapGetIn')
AddEventHandler('qb-trunk:client:KidnapGetIn', function(veh)
    local ped = PlayerPedId()
    local closestVehicle = veh
    local vehClass = GetVehicleClass(closestVehicle)
    local plate = GetVehicleNumberPlateText(closestVehicle)

    if Config.TrunkClasses[vehClass].allowed then
        ESX.TriggerServerCallback('qb-trunk:server:getTrunkBusy', function(isBusy)
            if not disabledCarCheck(closestVehicle) then
                if not inTrunk then
                    if not isBusy then
                        if not isKidnapped then
                            -- if GetVehicleDoorAngleRatio(closestVehicle, 5) > 0 then
                                offset = {
                                    x = Config.TrunkClasses[vehClass].x,
                                    y = Config.TrunkClasses[vehClass].y,
                                    z = Config.TrunkClasses[vehClass].z,
                                }
                                loadDict("fin_ext_p1-7")
                                TaskPlayAnim(ped, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
                                -- AttachEntityToEntity(ped, closestVehicle, -1, 0.0, -2.0, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                AttachEntityToEntity(ped, closestVehicle, 0, offset.x, offset.y, offset.z, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
                                TriggerServerEvent('qb-trunk:server:setTrunkBusy', plate, true)
                                inTrunk = true
                                Citizen.Wait(500)
                                SetVehicleDoorShut(closestVehicle, 5, false)
                                --QBCore.Functions.Notify('You\'re in the trunk.', 'success', 4000)
                                --exports['mythic_notify']:SendAlert('inform', 'You\'re in the trunk.')
								exports['Nico_Notify']:Alert('Info', 'Du bist im Kofferraum.', 10000, 'success', true)
                                TrunkCam(true)

                                isKidnapped = true
                            -- else
                                -- QBCore.Functions.Notify('Is the trunk closed?', 'error', 2500)
                            -- end
                        else
                            local ped = PlayerPedId()
                            local vehicle = GetEntityAttachedTo(PlayerPedId())
                            local plate = GetVehicleNumberPlateText(vehicle)
            
                            if GetVehicleDoorAngleRatio(vehicle, 5) > 0 then
                                local vehCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0, -5.0, 0)
                                DetachEntity(ped, true, true)
                                ClearPedTasks(ped)
                                inTrunk = false
                                TriggerServerEvent('qb-smallresources:trunk:server:setTrunkBusy', plate, nil)
                                SetEntityCoords(ped, vehCoords.x, vehCoords.y, vehCoords.z)
                                SetEntityCollision(PlayerPedId(), true, true)
                                TrunkCam(false)
                            else
                                --QBCore.Functions.Notify('The trunk is closed?', 'error', 2500)
                                --exports['mythic_notify']:SendAlert('error', 'The trunk is closed?')
								exports['Nico_Notify']:Alert('Info', 'Der Kofferraum ist abgeschlossen', 10000, 'error', true)
                            end
                        end
                    else
                        --QBCore.Functions.Notify('Anyone in there yet?', 'error', 2500)
                        --exports['mythic_notify']:SendAlert('error', 'Anyone in there yet?')
						exports['Nico_Notify']:Alert('Info', 'Ist da schon jemand drin?', 10000, 'error', true)
                    end 
                else
                    --QBCore.Functions.Notify('Your already in the trunk', 'error', 2500)
                    --exports['mythic_notify']:SendAlert('error', 'Your already in the trunk')
					exports['Nico_Notify']:Alert('Info', 'Du bist schon im Kofferraum', 10000, 'error', true)
                end 
            else
                --QBCore.Functions.Notify('You cant get in this trunk..', 'error', 2500)
                --exports['mythic_notify']:SendAlert('error', 'You cant get in this trunk..')
				exports['Nico_Notify']:Alert('Info', 'In diesen Kofferraum kommt man nicht rein...', 10000, 'error', true)
            end
        end, plate)
    else
        --QBCore.Functions.Notify('You cant get in this trunk..', 'error', 2500)
        --exports['mythic_notify']:SendAlert('error', 'You cant get in this trunk..')
		exports['Nico_Notify']:Alert('Info', 'In diesen Kofferraum kommt man nicht rein...', 10000, 'error', true)
    end
end)

RegisterNetEvent('qb-trunk:client:GetIn')
AddEventHandler('qb-trunk:client:GetIn', function(isKidnapped)
    local ped = PlayerPedId()
    local closestVehicle = getNearestVeh()

    if closestVehicle ~= 0 then
        local vehClass = GetVehicleClass(closestVehicle)
        local plate = GetVehicleNumberPlateText(closestVehicle)
        if Config.TrunkClasses[vehClass].allowed then
            ESX.TriggerServerCallback('qb-trunk:server:getTrunkBusy', function(isBusy)
                if not disabledCarCheck(closestVehicle) then
                    if not inTrunk then
                        if not isBusy then
                            if GetVehicleDoorAngleRatio(closestVehicle, 5) > 0 then
                                offset = {
                                    x = Config.TrunkClasses[vehClass].x,
                                    y = Config.TrunkClasses[vehClass].y,
                                    z = Config.TrunkClasses[vehClass].z,
                                }
                                loadDict("fin_ext_p1-7")
                                TaskPlayAnim(ped, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
                                -- AttachEntityToEntity(ped, closestVehicle, -1, 0.0, -2.0, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                AttachEntityToEntity(ped, closestVehicle, 0, offset.x, offset.y, offset.z, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
                                TriggerServerEvent('qb-trunk:server:setTrunkBusy', plate, true)
                                inTrunk = true
                                Citizen.Wait(500)
                                SetVehicleDoorShut(closestVehicle, 5, false)
                                --QBCore.Functions.Notify('You are already in the trunk.', 'Goodluck', 4000)
                                --exports['mythic_notify']:SendAlert('inform', 'You are already in the trunk.')
								exports['Nico_Notify']:Alert('Info', 'Du bist bereits im Kofferraum.', 10000, 'warning', true)
                                TrunkCam(true)
                            else
                                --QBCore.Functions.Notify('Is the trunk closed?', 'error', 2500)
                                --exports['mythic_notify']:SendAlert('error', 'Is the trunk closed?')
								exports['Nico_Notify']:Alert('Info', 'Der Kofferraum ist abgeschlossen', 10000, 'error', true)
                            end
                        else
                            --QBCore.Functions.Notify('Looks like there is some 1 in there?', 'error', 2500)
                            --exports['mythic_notify']:SendAlert('error', 'Looks like there is some 1 in there?')
							exports['Nico_Notify']:Alert('Info', 'Sieht aus, als wäre da eine 1 drin?', 10000, 'error', true)
                        end 
                    else
                        --QBCore.Functions.Notify('You are already in the trunk', 'error', 2500)
                        --exports['mythic_notify']:SendAlert('error', 'You are already in the trunk')
						exports['Nico_Notify']:Alert('Info', 'Du bist bereits im Kofferraum', 10000, 'error', true)
                    end 
                else
                    --QBCore.Functions.Notify('You cant get in this trunk..', 'error', 2500)
                    --exports['mythic_notify']:SendAlert('error', 'You cant get in this trunk..')
					exports['Nico_Notify']:Alert('Info', 'In diesen Kofferraum kommt man nicht rein...', 10000, 'error', true)
                end
            end, plate)
        else
            --QBCore.Functions.Notify('You cant get in this trunk..', 'error', 2500)
            --exports['mythic_notify']:SendAlert('error', 'You cant get in this trunk..')
			exports['Nico_Notify']:Alert('Info', 'In diesen Kofferraum kommt man nicht rein...', 10000, 'error', true)
        end
    else
        --QBCore.Functions.Notify('There is no vehicle to see.', 'error', 2500)
        --exports['mythic_notify']:SendAlert('error', 'There is no vehicle to see.')
		exports['Nico_Notify']:Alert('Info', 'Es ist kein Fahrzeug zu sehen.', 10000, 'error', true)
    end
end)

Citizen.CreateThread(function()
    while true do

        if inTrunk then
            if not isKidnapped then
                local ped = PlayerPedId()
                local vehicle = GetEntityAttachedTo(PlayerPedId())
                local drawPos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                local plate = GetVehicleNumberPlateText(vehicle)

                if DoesEntityExist(vehicle) then
                    DrawText3Ds(drawPos.x, drawPos.y, drawPos.z + 0.75, '[E] To get out of the trunk')

                    if IsControlJustPressed(0, 38) then
                        if GetVehicleDoorAngleRatio(vehicle, 5) > 0 then
                            local vehCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0, -5.0, 0)
                            DetachEntity(ped, true, true)
                            ClearPedTasks(ped)
                            inTrunk = false
                            TriggerServerEvent('qb-trunk:server:setTrunkBusy', plate, false)
                            SetEntityCoords(ped, vehCoords.x, vehCoords.y, vehCoords.z)
                            SetEntityCollision(PlayerPedId(), true, true)
                            TrunkCam(false)
                        else
                            --QBCore.Functions.Notify('Is the trunk closed?', 'error', 2500)
                            --exports['mythic_notify']:SendAlert('error', 'Is the trunk closed?')
							exports['Nico_Notify']:Alert('Info', 'Der Kofferraum ist abgeschlossen', 10000, 'error', true)

                        end
                    end

                    if GetVehicleDoorAngleRatio(vehicle, 5) > 0 then
                        DrawText3Ds(drawPos.x, drawPos.y, drawPos.z + 0.5, '[G] Zum Schließen des Kofferraums')
                        if IsControlJustPressed(0, 47) then
                            if not IsVehicleSeatFree(vehicle, -1) then
                                TriggerServerEvent('qb-radialmenu:trunk:server:Door', false, plate, 5)
                            else
                                SetVehicleDoorShut(vehicle, 5, false)
                            end
                        end
                    else
                        DrawText3Ds(drawPos.x, drawPos.y, drawPos.z + 0.5, '[G] Zum Öffnen des Kofferraums')
                        if IsControlJustPressed(0, 47) then
                            if not IsVehicleSeatFree(vehicle, -1) then
                                TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, 5)
                            else
                                SetVehicleDoorOpen(vehicle, 5, false, false)
                            end
                        end
                    end
                end
            end
        end

        if not inTrunk then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)
