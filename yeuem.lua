local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local ps = {
    Build3r_Flick27 = "1g0bm5LZwN",
    MateoSparkSparkly202 = "1g0bm5LZwN",
    ChillEpicNinja2010 = "uuTCRsPD0h",
    S3bastianSky200748 = "uuTCRsPD0h",
    HazelDawnSkaterYT  = "nBlPHArNcx",
    Primal_Code201115 = "nBlPHArNcx",
    Silv3rRiftEcho2006 = "OCJXCOnYr8",
    Bl0ckBlizzardByte = "OCJXCOnYr8",
    Pix3lat3dMystic2020Y = "tV0pYMpaUr",
    DanielNovaCyber2023 = "tV0pYMpaUr",
    R0gueDarkBeast = "rbjl9eqzWC",
    Zer0Chill82 = "rbjl9eqzWC",
    XxDarkWraithNovaxX20 = "flNdJ4YOcM",
    RavenQueen200991 = "flNdJ4YOcM",
    BlastSparkly201934 = "ezwFiTEd1U",
    OliverInfernoRider27 = "ezwFiTEd1U",
    XxLion_VenomxX15 = "bvhe7iMhIT",
    MaxTigerBane2002 = "bvhe7iMhIT",
    MaxTigerBane2002 = "AauA5M4PWH",
    St3althWraith85 = "AauA5M4PWH",
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
