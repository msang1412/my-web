local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

-- Private Server theo username
local ps = {
    DeSet2016     = "nBlPHArNcx",
    NguaSon2023   = "nBlPHArNcx",
    XxS0nD0xX2020 = "bGm6GQ6ZVb",
}

-- Config
getgenv().Config = {
    ['Lock Level'] = 567,
    ['Lock Stat'] = 700,
    ['Multi PS'] = true,
    ['Private Code'] = {}
}

-- Gán PS theo người chơi
if ps[player.Name] then
    table.insert(getgenv().Config['Private Code'], ps[player.Name])
end

getgenv().Sea = 1
script_key = "xQcVJKrfvzOGZhzEccXzQdrIuOqXpESM";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0c77fdc97b797339625442ae88021b1e.lua"))()
