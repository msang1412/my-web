repeat wait(0.5) until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "Radiant_814454014171021322"
getgenv().Speed = 50
getgenv().Config = {
    ['Multi Acc'] = 20,
    ['Kaitun Mythical Chest'] = true,
    ['Acc Desync'] = true,
    ['Settings'] = {
        ['Discord ID'] = '1213692707214598184',
        ['PS Delay'] = 36,
        ['FPS'] = 20,
        ['GUI'] = false
    },
    ['Merchant'] = {
        ['Rare Fruit Chest'] = false,
        ['Legendary Fruit Chest'] = false,
    },
    ['Private Server'] = true,
    ['Private Code'] = 'nBlPHArNcx',
    ['Tracker'] = false,
    ['Webhook'] = 'https://discord.com/api/webhooks/1455129616762015796/ifP9RRYZVuavM61UqkQ76N77inkd7KyPbGy-6v8GuCZ8N_djR3ylUdS3Xywt85db30_F'
}
task.delay(60, function() if not getgenv().Loaded then game:GetService("TeleportService"):Teleport(game.PlaceId) end end)
repeat task.wait(5)
    local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2RunE/RuneGuard/refs/heads/main/pro.lua"))()
end)
    if not success then task.wait(15) end
until getgenv().Loaded
