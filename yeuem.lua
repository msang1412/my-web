local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    BirdSkyDel28159 = "IMd5bxq56m",
    JacksonDaw96440 = "IMd5bxq56m",
    DragonSilv60818 = "QwQIxFW1H0",
    ForestFire27574 = "QwQIxFW1H0",
    AddisnDark43814  = "G3QZRBqQLe",
    EmmaMagicD10525 = "G3QZRBqQLe",
    KnightRedT71347 = "bGm6GQ6ZVb",
    AlphaDiamo60915 = "bGm6GQ6ZVb",
    JosephQuee94242 = "tV0pYMpaUr",
    ChrisStarS99336 = "tV0pYMpaUr",
    MysticMagi52812 = "Maue2DZ7ZX",
    MagicFoxRi77688 = "Maue2DZ7ZX",
    XxWilliamS27220 = "MlYUcgJml3",
    BenjaminMa10345 = "MlYUcgJml3",
    RubyDayIsl12076 = "rP4Yld86Xp",
    GreenEagle32274 = "rP4Yld86Xp",
    JamesRedBl24529 = "qJKD6dUmzD",
    AncientNeb80600 = "qJKD6dUmzD",
    OmegaDarkM45663 = "niPWrYngeB",
    NovaFirKni38569 = "niPWrYngeB",
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
