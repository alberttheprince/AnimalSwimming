local function IsPlayerAnimal()
    local ped = PlayerPedId()
    return GetPedType(ped) == 28
end

local function HandleAnimalSwim()
    local ped = PlayerPedId()

    CreateThread(function()
        while true do
            ped = PlayerPedId()
            
            if not IsPlayerAnimal() then
                Wait(5000)
            else
                Wait(200)

                SetPedDiesInWater(ped, false)
                SetPedDiesInstantlyInWater(ped, false)

                if IsEntityInWater(ped) and not IsPedInAnyVehicle(ped, false) then
                    SetPedCanRagdoll(ped, false)

                    local maxHealth = GetEntityMaxHealth(ped)
                    if GetEntityHealth(ped) < maxHealth then
                        SetEntityHealth(ped, maxHealth)
                    end

                    local submergedLevel = GetEntitySubmergedLevel(ped)
                    local pedCoords = GetEntityCoords(ped)
                    local _, waterHeight = GetWaterHeight(pedCoords.x, pedCoords.y, pedCoords.z)
                    local waterDepth = waterHeight - pedCoords.z

                    if submergedLevel > 0.25 then
                        if waterDepth <= 0.5 then
                            ApplyForceToEntity(ped, 1, 0.0, 0.0, 0.6, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        else
                            local force = math.min(0.4 * (submergedLevel - 0.25), 0.2)
                            ApplyForceToEntity(ped, 1, 0.0, 0.0, force, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        end

                        if pedCoords.z > waterHeight + 0.1 then
                            ApplyForceToEntity(ped, 1, 0.0, 0.0, -0.1, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        end

                        if pedCoords.z < waterHeight - 0.1 then
                            ApplyForceToEntity(ped, 1, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        end

                        local currentRotation = GetEntityRotation(ped, 2)
                        SetEntityRotation(ped, currentRotation.x + 0.2, currentRotation.y, currentRotation.z, 2, true)
                    end
                else
                    SetPedCanRagdoll(ped, true)
                end
            end
        end
    end)
end
