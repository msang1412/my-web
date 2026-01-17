local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    BarSilvrBe56205 = "1qGGE7HI4T",
    FastSunGal30053 = "1qGGE7HI4T",
    MatthewSun12422 = "qkyHHfqP4K",
    JosephDusk96776 = "qkyHHfqP4K",
    AubreyPear55632  = "R6Ti8hdgpz",
    HuntrEmral92816 = "R6Ti8hdgpz",
    SilverPrin29850 = "OCJXCOnYr8",
    MysticAnci40474 = "OCJXCOnYr8",
    GreenBetaA84190 = "Dc3VLZ1riu",
    RainNightN39571 = "Dc3VLZ1riu",
    TopazRivrT58779 = "rbjl9eqzWC",
    MiaSkyDeer14826 = "rbjl9eqzWC",
    XxAmbrDawn62721 = "HaOJYbe6Uf",
    MythBoldSt37948 = "HaOJYbe6Uf",
    JadeFreeDe57472 = "ezwFiTEd1U",
    XxTigerPho26201 = "ezwFiTEd1U",
    DragonPrin53636 = "bvhe7iMhIT",
    ZoeQueenDa25211 = "bvhe7iMhIT",
    FireEagleI91580 = "AauA5M4PWH",
    AmeliaDayT86132 = "AauA5M4PWH",
}

repeat task.wait(0.5) until game:IsLoaded() and player

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
    ['Private Code'] = '',
    ['Tracker'] = false,

    ['Webhook'] = 'https://discord.com/api/webhooks/1427165628778938408/C_KNvE0DpZH8utzct_ruiNHl6GfjhN1H4uMdmYS45k8YPrsDLKbw4XQrKnXKG3Xwgd86'
}

local username = player.Name
if ps[username] then
    getgenv().Config['Private Code'] = ps[username]
end

task.delay(60, function()
    if not getgenv().Loaded then
        TeleportService:Teleport(game.PlaceId)
    end
end)

repeat
    task.wait(5)
    local success = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/x2RunE/RuneGuard/refs/heads/main/pro.lua"))()
    end)
    if not success then
        task.wait(15)
    end
until getgenv().Loaded
