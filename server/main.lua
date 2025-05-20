ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('json:dataStructure')
AddEventHandler('json:dataStructure', function(data)
end)

RegisterServerEvent('qb-radialmenu:trunk:server:Door')
AddEventHandler('qb-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('qb-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('radialmenu:showID')
AddEventHandler('radialmenu:showID', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local data = {
        name = xPlayer.getName(),
        dob = '01.01.1990', -- Beispiel
        job = xPlayer.job.label
    }

    if target then
        TriggerClientEvent('radialmenu:openIDCard', target, data)
    else
        TriggerClientEvent('radialmenu:openIDCard', source, data)
    end
end)

RegisterNetEvent('jsfour-idcard:getSelfData')
AddEventHandler('jsfour-idcard:getSelfData', function(docType)
    local xPlayer = ESX.GetPlayerFromId(source)
    local data = {}

    table.insert(data, {
        name = GetPlayerName(source),
        firstname = xPlayer.get('firstName'),
        lastname = xPlayer.get('lastName'),
        dateofbirth = xPlayer.get('dateofbirth'),
        sex = xPlayer.get('sex'),
        height = xPlayer.get('height'),
        type = docType
    })

    TriggerClientEvent('jsfour-idcard:open', source, data, docType)
end)
