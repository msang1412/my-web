repeat wait(0.5) until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "Radiant_814454014171021322"
getgenv().Speed = 50
getgenv().Config = {
    ['Multi Acc'] = 5,
    ['Kaitun Mythical Chest'] = true,
    ['Acc Desync'] = false,
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
    ['Private Code'] = 'ezwFiTEd1U',
    ['Tracker'] = false,
    ['Webhook'] = 'https://discord.com/api/webhooks/1317008318979506186/7cHRjfhewaO7_F7AlFpOHNbL5t1272e_VZ3aQv1AV7j9ya0ea-dbsGmhs86IZCpODptT'
}
task.delay(60, function() if not getgenv().Loaded then game:GetService("TeleportService"):Teleport(game.PlaceId) end end)
repeat task.wait(5)
    local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2RunE/RuneGuard/refs/heads/main/pro.lua"))()
end)
    if not success then task.wait(15) end
until getgenv().Loaded
