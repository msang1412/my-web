local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    XxRocketToxicxX78 = "Ps0H3uah4o",
    XxDanc3rSab3rxX20083 = "Ps0H3uah4o",
    ThunderstrikeIsla = "TXZmTajqfq",
    HenryGamerArrow27 = "TXZmTajqfq",
    MICHA3L_Str3am75  = "2omXuRFniv",
    HazelCyber26 = "2omXuRFniv",
    AvaBearKing201570 = "OCJXCOnYr8",
    XxTiger_FlamexX2016 = "OCJXCOnYr8",
    RiftBruce = "Dc3VLZ1riu",
    XxPixela = "Dc3VLZ1riu",
    Xx_Am3liaLightWraith = "rbjl9eqzWC",
    XxLeviProWraithxX = "rbjl9eqzWC",
    Toxic_Epic17 = "HaOJYbe6Uf",
    Xx_STREAMDRAG0NPANDA = "HaOJYbe6Uf",
    knollElijah = "sMDe2GJOpq",
    StreamVortex202042 = "sMDe2GJOpq",
    XxBeastDawnxX40 = "bvhe7iMhIT",
    XxJax0nOrbitxX2008YT = "bvhe7iMhIT",
    Daniel_Dancer2014YT = "AauA5M4PWH",
    Bane_Wraith38 = "AauA5M4PWH",
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
