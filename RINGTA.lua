local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- :white_check_mark: Auto-Execute on Game Start
loadstring(game:HttpGet("https://raw.githubusercontent.com/hbjrev/RINGTA.github.io/refs/heads/main/AUTOBOND.lua"))()

-- :white_check_mark: Auto-Execute After Teleporting
LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.InProgress then
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport([[ 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/hbjrev/RINGTA.github.io/refs/heads/main/AUTOBOND.lua"))()
            ]])
        elseif queue_on_teleport then
            queue_on_teleport([[ 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/hbjrev/RINGTA.github.io/refs/heads/main/AUTOBOND.lua"))()
            ]])
        end
    end
end)
