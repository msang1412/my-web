local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    Ph03nix_M00N50 = "nBlPHArNcx",
    XxHazePowerxX96 = "nBlPHArNcx",

    TurboCrazeMystic2005 = "bGm6GQ6ZVb",
    LaylaShadowQueen45 = "bGm6GQ6ZVb",

    UltraMast3r201034 = "tV0pYMpaUr",
    Xx_EmmaCircuitSparkl = "tV0pYMpaUr",

    HawkTurboBacon53 = "JUGHWiUw0T",
    EzraKing202481 = "JUGHWiUw0T",

    FlashClawN3on2020 = "BJG2x8SsVL",
    JAM3S_Danc3r89 = "BJG2x8SsVL",

    SamuelP0werC00kie200 = "Kg8iGai7fZ",
    XxJaydenProPrimalxX = "Kg8iGai7fZ",

    Fusi0n_Wraith201768 = "PiHn10meSk",
    AidenSonicStormy2021 = "PiHn10meSk",

    XxProHeroCookiexXYT = "lX6jT9kJxh",
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
