Citizen.Wait(1000)

QBCore = exports['qb-core']:GetCoreObject()

local servername = "YOURSERVER"
local servergenre = "ROLEPLAY"

Citizen.CreateThread(function(source)
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(3)
    end

    DisplayRadar(false)

    while true do
        if QBCore ~= nil then
            TriggerServerEvent("setinfo")

            local ped = PlayerPedId()
            Wait(1)
            SendNUIMessage({
                type="canshowui"
            })
            local health = GetEntityHealth(ped) / 2
            local armor = GetPedArmour(ped) * 1.333333333333333
            SendNUIMessage({
                type="updateHPAR",
                hp = health,
                he = armor
            })

            SendNUIMessage({
                type="servernamegenreload",
                sv_name = servername,
                sv_genre = servergenre
            })
        end

        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function(source)
    while true do
        Citizen.Wait(400)
        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle ~= 0 then
            local isDriver = GetPedInVehicleSeat(vehicle, -1) == playerPed

            local speed = GetEntitySpeed(vehicle)

            local speedKmh = speed * 3.6

            local carFuel = GetVehicleFuelLevel(vehicle)

            if isDriver then
                DisplayRadar(true)
                SendNUIMessage({
                    type="drivernow",
                    kmh = speedKmh,
                    fuel = carFuel
                })
                
            else
                SendNUIMessage({
                    type="seatnow"
                })
                DisplayRadar(true)
                
            end
        else
            SendNUIMessage({
                type="normalnow"
            })
            DisplayRadar(false)
        end
    end
end)

RegisterNetEvent("takeinfo", function(charName, money, playercount, playerjob)
    SendNUIMessage({
        type="updateInfo",
        name = charName,
        cash = money,
        pcount = playercount,
        id = GetPlayerServerId(PlayerId()),
        pjob = playerjob
    })
end)


RegisterNetEvent("updatemeta", function(hunger, thirsty)
    SendNUIMessage({
        type="updateMetaUI",
        phunger = hunger,
        pthirsty = thirsty,
    })
end)


Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)

