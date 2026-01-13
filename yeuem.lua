local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    XxLavaCraz3MaxxX = "IMd5bxq56m",
    RiftStar200561 = "IMd5bxq56m",
    Ghost_Chas385 = "QwQIxFW1H0",
    XxDarkRoguexX51 = "QwQIxFW1H0",
    XxLunaHunt3rUltraxX2  = "G3QZRBqQLe",
    LunaMaxCookie202277 = "G3QZRBqQLe",
    PixelatedHer0Starry2 = "bGm6GQ6ZVb",
    KnightGlitchMax49 = "bGm6GQ6ZVb",
    FOX_Prism29 = "0ujTZPnQvD",
    XxKingFlickWolfxX = "0ujTZPnQvD",
    Beast_Toxic91 = "Maue2DZ7ZX",
    Charl0tteRavenHaze37 = "Maue2DZ7ZX",
    KnightChillSilver61 = "MlYUcgJml3",
    StormStream76 = "MlYUcgJml3",
    XxNinjaStarxX2002 = "rP4Yld86Xp",
    VortexRiderFury2020 = "rP4Yld86Xp",
    ElijahPandaCrystal61 = "qJKD6dUmzD",
    Mat3oPandaGalaxy = "qJKD6dUmzD",
    Drift_Shadow200461 = "niPWrYngeB",
    HenryChaosLion2023 = "niPWrYngeB",
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
