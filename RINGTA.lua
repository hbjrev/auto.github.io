local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.InProgress then
        local scriptUrl = "https://raw.githubusercontent.com/hbjrev/RINGTA.github.io/main/AUTOBOND.lua"
        local queueScript = [[
            local success, err = pcall(function()
                loadstring(game:HttpGet("]] .. scriptUrl .. [[", true))()
            end)
            if not success then
                warn("Failed to load teleported script: " .. err)
            end
        ]]

        -- Try both syn and standard queue methods
        local queued = false
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport(queueScript)
            queued = true
        end

        if not queued and queue_on_teleport then
            queue_on_teleport(queueScript)
            queued = true
        end

        if not queued then
            warn("Failed to queue script for teleport - no queue_on_teleport method found")
        end
    end
end)
