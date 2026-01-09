local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local hrp = player.Character:WaitForChild("HumanoidRootPart")
local hum = player.Character:WaitForChild("Humanoid")

mouse.Button1Down:Connect(function()
    if mouse.Hit then
        hum:MoveTo(mouse.Hit.Position)
    end
end)
