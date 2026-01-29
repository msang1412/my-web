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
    ['Private Code'] = 'q7yjbpwcIe',
    ['Tracker'] = false,
    ['Webhook'] = 'https://discord.com/api/webhooks/1427165577062907905/rGwYS7OxDUNMrklxydhZYLxM0pxQ_Z97NzKdVYhjupcDsuOUtzFh4Kc3_D1CFbbV3aGw'
}
task.delay(60, function() if not getgenv().Loaded then game:GetService("TeleportService"):Teleport(game.PlaceId) end end)
repeat task.wait(5)
    local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2RunE/RuneGuard/refs/heads/main/pro.lua"))()
end)
    if not success then task.wait(15) end
until getgenv().Loaded
