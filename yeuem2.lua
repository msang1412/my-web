local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    XxStreamSparkVortexx = "IMd5bxq56m",
    PulseQueenBear19 = "IMd5bxq56m",
    Jax0n_C0de2013YT = "QwQIxFW1H0",
    Mast3rChas373 = "QwQIxFW1H0",
    Jayden_Night92  = "G3QZRBqQLe",
    FlashHunterEcho2023 = "G3QZRBqQLe",
    GraceRocketBuilder62 = "SKioLKTc7kw",
    LiamUltraHyp3r = "SKioLKTc7kw",
    XxCodeBytexX43 = "mlMjKyMqnw",
    XxEzraBuild3rChillxX = "mlMjKyMqnw",
    Mas0nSparkly201329 = "Maue2DZ7ZX",
    PulseLuckyFlick15 = "Maue2DZ7ZX",
    XxLavaViperPr0xX2019 = "MlYUcgJml3",
    Night_SABER201122 = "MlYUcgJml3",
    NoahDuckChaos2010 = "rP4Yld86Xp",
    Xx_GalaxyNightMystic = "rP4Yld86Xp",
    JellyOmega200578 = "qJKD6dUmzD",
    LegendQueenNinja2020 = "qJKD6dUmzD",
    EzraAc3Gold3n36 = "dmgBOmXnQy",
    RocketDark2017YT = "dmgBOmXnQy",
}

repeat task.wait(0.5) until game:IsLoaded() and player

getgenv().Key = "Radiant_814454014171021322"
getgenv().Speed = 50

getgenv().Config = {
    ['Multi Acc'] = 17,
    ['Kaitun Mythical Chest'] = true,
    ['Acc Desync'] = false,

    ['Settings'] = {
        ['Discord ID'] = '1213692707214598184',
        ['PS Delay'] = 36,
        ['FPS'] = 25,
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
