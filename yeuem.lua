local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    LoomAva = "IMd5bxq56m",
    Ethan_SPARK2009YT = "IMd5bxq56m",
    DriftTigerSonicYT = "QwQIxFW1H0",
    HenryNinjaFury2023 = "QwQIxFW1H0",
    Emma_Fury40  = "G3QZRBqQLe",
    XxLionKingKnightxX = "G3QZRBqQLe",
    Obsidianscott = "bGm6GQ6ZVb",
    BaneAlphaCraft = "bGm6GQ6ZVb",
    RiftHazeBacon34 = "tV0pYMpaUr",
    XxRiftInfernoShadowx = "tV0pYMpaUr",
    Xx_DragonStreamCircu = "Maue2DZ7ZX",
    PulseZapSlime2009 = "Maue2DZ7ZX",
    FlashLuminos = "MlYUcgJml3",
    XXKAYLEE_BladexX2007 = "MlYUcgJml3",
    SavannahAc336 = "rP4Yld86Xp",
    EzraCrystalBuilder84 = "rP4Yld86Xp",
    AquaGamerOmega2006 = "qJKD6dUmzD",
    Julian_Tig3r68 = "qJKD6dUmzD",
    CatalystScarlett = "niPWrYngeB",
    Zayd3n_Chaos79 = "niPWrYngeB",
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
