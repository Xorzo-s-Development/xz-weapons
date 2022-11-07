-----------------For support, scripts, and more----------------
---------------  https://discord.gg/htHDtwCxAX  ---------------
---------------------------------------------------------------

CreateThread(function()
	while true do
        local ped = PlayerPedId()
        local sleep = 1500
        if IsPedArmed(ped, 4) then
            sleep = 0
            if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
                local _,wep = GetCurrentPedWeapon(PlayerPedId())
                if Config.recoils[wep] and Config.recoils[wep] ~= 0 then
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Config.recoils[wep])
                end
            end
            if Config.FirstPersonOnly then
                if IsControlPressed(0, 25) then
                    if GetFollowPedCamViewMode() == 4 and not check then
                        check = false
                    else
                        SetFollowPedCamViewMode(4)
                        check = true
                    end
                else
                    DisablePlayerFiring(PlayerPedId(), true)
                    if check then
                        SetFollowPedCamViewMode(1)
                        check = false
                    end
                end
            end
        end
        Wait(sleep)
	end
end)
