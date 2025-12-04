print("boost fps now")
local UserSettings = UserSettings()
local RenderSettings = settings().Rendering
local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Config = {
    RenderDistance = 300,
    RemoveAccessories = true,
    RemoveParticles = true,
    DisableShadows = true,
    SimplifyTerrain = true,
    DisablePostEffects = true,
    LowGraphicsMode = true,
    DisableAnimations = false,
    RemoveTextures = true,
    OptimizeCharacters = true,
    FPSCap = 999,
}

pcall(function()
    RenderSettings.QualityLevel = Enum.QualityLevel.Level01
    RenderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
    
    for _, child in pairs(UserSettings:GetChildren()) do
        if child:IsA("UserGameSettings") then
            child.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        end
    end
    
    settings().Rendering.EnableFRM = false
    settings().Rendering.FrameRateManager = Enum.FramerateManagerMode.Off
end)

if Config.DisablePostEffects then
    pcall(function()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.FogStart = 9e9
        Lighting.Brightness = 0
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
        Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
        Lighting.ClockTime = 12
        
        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or 
               effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") or
               effect:IsA("SunRaysEffect") or effect:IsA("DepthOfFieldEffect") or
               effect:IsA("Atmosphere") or effect:IsA("Sky") or 
               effect:IsA("Clouds") then
                effect:Destroy()
            end
        end
    end)
end

if Config.SimplifyTerrain then
    pcall(function()
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterReflectance = 0
            Terrain.WaterTransparency = 1
            Terrain.Decoration = false
            sethiddenproperty(Terrain, "Decoration", false)
        end
    end)
end

local removeList = {
    "Smoke", "Fire", "Sparkles", "ParticleEmitter", 
    "Trail", "Beam", "PointLight", "SpotLight", 
    "SurfaceLight", "Sound"
}

local function optimizeObject(obj)
    pcall(function()
        if table.find(removeList, obj.ClassName) then
            obj:Destroy()
            return
        end
        
        if obj:IsA("BasePart") then
            if Config.DisableShadows then
                obj.CastShadow = false
            end
            obj.Material = Enum.Material.Plastic
            obj.Reflectance = 0
            
            if obj:IsA("MeshPart") then
                obj.RenderFidelity = Enum.RenderFidelity.Performance
                obj.CollisionFidelity = Enum.CollisionFidelity.Box
            end
            
            if obj:IsA("SpecialMesh") then
                obj.TextureId = ""
            end
        end
        
        if Config.RemoveTextures then
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
            end
        end
        
        if obj:IsA("SurfaceGui") or obj:IsA("BillboardGui") then
            obj.AlwaysOnTop = false
            obj.LightInfluence = 0
        end
    end)
end

for _, obj in pairs(workspace:GetDescendants()) do
    optimizeObject(obj)
end

workspace.DescendantAdded:Connect(optimizeObject)

local function optimizeCharacter(char)
    if not char then return end
    
    task.spawn(function()
        pcall(function()
            if Config.RemoveAccessories then
                for _, obj in pairs(char:GetDescendants()) do
                    if obj:IsA("Accessory") or obj:IsA("Hat") or 
                       obj:IsA("Shirt") or obj:IsA("Pants") or 
                       obj:IsA("ShirtGraphic") then
                        obj:Destroy()
                    end
                end
            end
            
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CastShadow = false
                    part.Material = Enum.Material.Plastic
                    part.Reflectance = 0
                end
                
                if table.find(removeList, part.ClassName) then
                    part:Destroy()
                end
            end
            
            if Config.DisableAnimations then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                        track:Stop()
                    end
                end
            end
        end)
    end)
end

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        optimizeCharacter(player.Character)
    end
    player.CharacterAdded:Connect(optimizeCharacter)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(optimizeCharacter)
end)

local partCache = {}
local hiddenParts = {}

local function updateRenderDistance()
    pcall(function()
        local camPos = Camera.CFrame.Position
        
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Parent ~= Player.Character then
                local distance = (camPos - part.Position).Magnitude
                
                if distance > Config.RenderDistance then
                    if not hiddenParts[part] then
                        hiddenParts[part] = part.Parent
                        part.Parent = nil
                    end
                elseif hiddenParts[part] then
                    part.Parent = hiddenParts[part]
                    hiddenParts[part] = nil
                end
            end
        end
    end)
end

task.spawn(function()
    while task.wait(0.5) do
        updateRenderDistance()
    end
end)

pcall(function()
    for _, sound in pairs(game:GetDescendants()) do
        if sound:IsA("Sound") then
            sound.Volume = 0
            sound:Stop()
        end
    end
    
    game.DescendantAdded:Connect(function(obj)
        if obj:IsA("Sound") then
            obj.Volume = 0
            obj:Stop()
        end
    end)
end)

pcall(function()
    settings().Network.IncomingReplicationLag = 0
end)

pcall(function()
    setfpscap(Config.FPSCap)
end)

for _, gui in pairs(Player:WaitForChild("PlayerGui"):GetDescendants()) do
    if gui:IsA("Frame") or gui:IsA("ImageLabel") or gui:IsA("ImageButton") then
        gui.BackgroundTransparency = 1
        gui.ImageTransparency = 1
    end
end

task.spawn(function()
    while task.wait(60) do
        pcall(function()
            for i = 1, 5 do
                game:GetService("RunService").Heartbeat:Wait()
            end
        end)
    end
end)
print("done")
