local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

-- Private Server theo username
local ps = {
    Ta0Than2013     = "nBlPHArNcx",
    MotBinhHoang2012   = "nBlPHArNcx",
    XepManh2014 = "bGm6GQ6ZVb",
    XxDucVatxX99     = "bGm6GQ6ZVb",
    ManhLuaKim   = "JUGHWiUw0T",
    SonXuat2010 = "JUGHWiUw0T",
    SacMot52     = "Kg8iGai7fZ",
    VangGau80   = "Kg8iGai7fZ",
    ChopVuong2013VN = "MMfKKLp0q2",
    XxTri_BinhxX     = "MMfKKLp0q2",
    LongHonTao   = "NuMwZftdmD",
    Bau_Thanh = "NuMwZftdmD",
    NangSangBa0     = "xTBHiIhnz4",
    XayThanCu0ng   = "xTBHiIhnz4",
    GiangVitCap = "JzIF0s4mHr",
    GIO_Soi201237   = "JzIF0s4mHr",
    TaoChuaDem = "tV0pYMpaUr",
    HoaThanBac     = "tV0pYMpaUr",
    Phu0ngXinh2007   = "byfJPkPozQ",
    Ph0ngLaiVN = "byfJPkPozQ",
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
script_key = "yjXgqkaIFaSWfjDqPkOWiZdRMPYajdiK";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0c77fdc97b797339625442ae88021b1e.lua"))()
