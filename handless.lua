repeat wait(0.5) until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "Radiant_814454014171021322"
getgenv().Speed = 50
getgenv().Config = {
    ['Multi Acc'] = 15,
    ['Kaitun Mythical Chest'] = true,
    ['Acc Desync'] = true,
    ['Settings'] = {
        ['Discord ID'] = '1213692707214598184',
        ['PS Delay'] = 36,
        ['FPS'] = 30,
        ['GUI'] = false
    },
    ['Merchant'] = {
        ['Rare Fruit Chest'] = false,
        ['Legendary Fruit Chest'] = false,
    },
    ['Private Server'] = true,
    ['Private Code'] = 'tV0pYMpaUr',
    ['Tracker'] = false,
    ['Webhook'] = 'https://discord.com/api/webhooks/1427165862653333526/ZC9Z8IFDcYw863YjWm_1oMD7bXgjCGonOrnLrTh7O2Qn5_3M3hD4nP8sNwHr-DwpY86g'
}
task.delay(60, function() if not getgenv().Loaded then game:GetService("TeleportService"):Teleport(game.PlaceId) end end)
repeat task.wait(5)
    local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2RunE/RuneGuard/refs/heads/main/pro.lua"))()
end)
    if not success then task.wait(15) end
until getgenv().Loaded
