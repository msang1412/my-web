repeat task.wait(55) until game:IsLoaded(35)
local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
				sethiddenproperty(Terrain, "Decoration", false)
				sethiddenproperty(game.Lighting, "Technology", 0)
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat,false)
game:GetService("RunService"):Set3dRenderingEnabled(false)
UserSettings():GetService('UserGameSettings').MasterVolume = 0;
game.StarterGui:SetCore("TopbarEnabled", false)
game.StarterGui:SetCore("DevConsoleVisible", false)
					Terrain.WaterWaveSize = 0
					Terrain.WaterWaveSpeed = 0
					Terrain.WaterReflectance = 0
					Terrain.WaterTransparency = 0
game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").ShadowSoftness = 00000
game:GetService("Lighting").FogEnd = 100000
game:GetService("Lighting").Brightness = -0.9
settings().Rendering.QualityLevel = 1;
for i, v in pairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Transparency = 1
    elseif (v:IsA("Decal") or v:IsA("Texture")) and GetDescendants then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") and GetDescendants then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") and GetDescendants then
        v.BlastPressure = 1
        v.BlastRadius = 1
        v.Enabled = false
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") and GetDescendants then
        v.Enabled = false
    elseif v:IsA("MeshParts") and GetDescendants then
        v.Material = "Plastic"
        v.RenderFidelity = 2
        v.Reflectance = 0
        v.Transparency = 1
        v.TextureID= 10385902758728957
    elseif v:IsA("SpecialMesh") and GetDescendants  then
        v.Transparency = 1
    elseif v:IsA("Images") and GetDescendants  then
        v.Transparency = 1
    elseif v:IsA("ShirtGraphic") and GetDescendants then
        v.Graphic = 0
    elseif v:IsA("Clothing") or v:IsA("SurfaceAppearance") or v:IsA("BaseWrap") and GetDescendants then
        v:Destroy()
    elseif v:IsA("Texture") and GetDescendants then
        v.Transparency = 1
    elseif v:IsA("TextLabel") and v:IsDescendantOf(workspace) then
        v.Font = Enum.Font.SourceSans
        v.TextScaled = false
        v.RichText = false
        v.TextSize = 1
    end
end
local Lighting = game:GetService("Lighting")
				for i, v in pairs(Lighting:GetDescendants()) do
					if v:IsA("BloomEffect") then
						v.Enabled = false
					end
				end
				for i, v in pairs(Lighting:GetDescendants()) do
					if v:IsA("BlurEffect") then
						v.Enabled = false
					end
				end
				for i, v in pairs(Lighting:GetDescendants()) do
					if v:IsA("SunRaysEffect") then
						v.Enabled = false
					end
				end
				for i, v in pairs(Lighting:GetDescendants()) do
					if v:IsA("ColorCorrectionEffect") then
						v.Enabled = false
					end
				end
				for i, v in pairs(Lighting:GetDescendants()) do
					if v:IsA("DepthOfFieldEffect") then
						v.Enabled = false
					end
				end 
				for i, v in pairs(Lighting:GetDescendants()) do
					if v:IsA("PostEffect") then
						v.Enabled = false
					end
				end
                for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do 
                     if v:IsA("Sky") then 
                         v:Destroy()
                    end
end
if setfflag then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end
game:GetService("Workspace").FlyBorder:Destroy()
game:GetService("Workspace").FlyBorder2:Destroy()
game:GetService("Workspace").ALWAYS_RENDERING:Destroy()
game:GetService("Workspace").Border2:Destroy()
game:GetService("ReplicatedStorage").Assets.Animations:Destroy()
game:GetService("ReplicatedStorage").Assets.Skyboxes:Destroy()           
