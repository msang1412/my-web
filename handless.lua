local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

-- Private Server theo username
local ps = {
    Ph03nix_M00N50     = "nBlPHArNcx",
    XxHazePowerxX96   = "nBlPHArNcx",
    TurboCrazeMystic2005 = "bGm6GQ6ZVb",
    LaylaShadowQueen45     = "bGm6GQ6ZVb",
    UltraMast3r201034   = "tV0pYMpaUr",
    Xx_EmmaCircuitSparkl = "tV0pYMpaUr",
    HawkTurboBacon53     = "JUGHWiUw0T",
    EzraKing202481   = "JUGHWiUw0T",
    FlashClawN3on2020 = "BJG2x8SsVL",
    JAM3S_Danc3r89     = "BJG2x8SsVL",
    SamuelP0werC00kie200   = "Kg8iGai7fZ",
    XxJaydenProPrimalxX = "Kg8iGai7fZ",
    Fusi0n_Wraith201768     = "PiHn10meSk",
    AidenSonicStormy2021   = "PiHn10meSk",
    XxProHeroCookiexXYT = "lX6jT9kJxh",
}

-- Config
getgenv().Config = {
    ['Lock Level'] = 567,
    ['Lock Stat'] = 700,
    ['Multi PS'] = true,
    ['Private Code'] = {}
}

-- GĂ¡n PS theo ngÆ°á»i chÆ¡i
if ps[player.Name] then
    table.insert(getgenv().Config['Private Code'], ps[player.Name])
end

getgenv().Sea = 1
script_key = "xQcVJKrfvzOGZhzEccXzQdrIuOqXpESM";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0c77fdc97b797339625442ae88021b1e.lua"))()
