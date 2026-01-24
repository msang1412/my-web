local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    PebbleRevelation = "1qGGE7HI4T",
    MysticDenise = "1qGGE7HI4T",
    DevilTadhg = "uuTCRsPD0h",
    SimicRebecca = "uuTCRsPD0h",
    OpportunityMountain  = "nBlPHArNcx",
    AndroidAncient = "nBlPHArNcx",
    CinderRonan = "OCJXCOnYr8",
    CometJamie = "OCJXCOnYr8",
    FiendSharon = "Dc3VLZ1riu",
    RumbleRonan = "Dc3VLZ1riu",
    valeMadison = "rbjl9eqzWC",
    DuergarJamie = "rbjl9eqzWC",
    HonorSparkly = "1dwFLa65H2",
    CrossbowSamuel = "1dwFLa65H2",
    FaerieChill = "ezwFiTEd1U",
    SupergiantLuis = "ezwFiTEd1U",
    MerfolkBetty = "bvhe7iMhIT",
    UtopiaRoss = "bvhe7iMhIT",
    RockGnomeNathan = "AauA5M4PWH",
    SwordNorman = "AauA5M4PWH",
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
