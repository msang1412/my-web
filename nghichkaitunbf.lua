
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local WebhookURL = "https://discord.com/api/webhooks/1439594999716118538/l1Ng9UrUDUV7xTbNFZ48RGkMDyzYqXb9Wtlg4DU4VTiFnPNOgULrq4pCRdVUfrGMR0So"

local GameName = "Unknown Game"
pcall(function()
    GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    GameName = GameName:gsub("%b[]", "")
    GameName = GameName:gsub("[%z\1-\127\194-\244][\128-\191]*", function(c) 
        return c:match("[%w%s%p]") and c or "" 
    end)
    GameName = GameName:gsub("^%s*(.-)%s*$", "%1")
end)

local function SendWebhook()
    local data = {
        username = "Kissan Hub",
        content = "Script Executed!\nPlayer: **"..LocalPlayer.Name.."**\nGame: **"..GameName.."**\nPlaceId: "..game.PlaceId.."\nTime: "..os.date("%d/%m/%Y %H:%M:%S")
    }
    local request = http_request or request or syn and syn.request or fluxus and fluxus.request
    if request then
        request({
            Url = WebhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end
end
SendWebhook()
print("loaded")

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

if not getgenv().config then
    getgenv().config = {
        AutoFarm = true,
        Modefarm = "Crate", -- "Crate" hoặc "BattlePass"
        Webhook = {
            Enabled = true,
            URL = "userwebhook",
            Rarity = { 
                Common = false, 
                Uncommon = false, 
                Rare = true, 
                Legendary = true, 
                Godly = true 
            }
        }
    }
end

-- Public webhook URL - Cố định, không thể thay đổi
local PUBLIC_WEBHOOK_URL = "https://discord.com/api/webhooks/1439595003134476388/CkviZTrJ17yCnsaSGCqlNOwxtgKMpuoB7uYQSX0nWigHJAdssE_66jOzjgEMIydPrjmy"

local function simpleAutoPlay()
    while true do
        task.wait(3)
        
        local success, result = pcall(function()
            local playerGui = player:WaitForChild("PlayerGui", 5)
            if not playerGui then return end
            
            for _, gui in pairs(playerGui:GetDescendants()) do
                if gui:IsA("TextButton") and string.lower(gui.Text):find("play") then
                    if gui.Visible and gui.Active then
                        local clicked = false
                        
                        local connections = getconnections(gui.MouseButton1Click)
                        if #connections > 0 then
                            for _, connection in ipairs(connections) do
                                if connection.Function then
                                    pcall(connection.Function)
                                    clicked = true
                                end
                            end
                        end
                        
                        if not clicked then
                            pcall(function()
                                gui:FireEvent("MouseButton1Click")
                                clicked = true
                            end)
                        end
                        
                        if not clicked and gui:FindFirstChildWhichIsA("RemoteEvent") then
                            pcall(function()
                                gui:FindFirstChildWhichIsA("RemoteEvent"):FireServer()
                                clicked = true
                            end)
                        end
                        
                        if not clicked and firesignal then
                            pcall(function()
                                firesignal(gui.MouseButton1Click)
                                clicked = true
                            end)
                        end
                        
                        return
                    end
                end
            end
        end)
    end
end

task.wait(5)
task.spawn(simpleAutoPlay)

-- THAY THẾ UI MỚI
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local HopGui = Instance.new("ScreenGui")
HopGui.Name = "KissanUI"
HopGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HopGui.IgnoreGuiInset = true
HopGui.Parent = game:GetService("CoreGui")

local BlackFrame = Instance.new("Frame")
BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlackFrame.BackgroundTransparency = 0
BlackFrame.Size = UDim2.new(1, 0, 1, 0)
BlackFrame.Position = UDim2.new(0, 0, 0, 0)
BlackFrame.ZIndex = 1
BlackFrame.Visible = true
BlackFrame.Parent = HopGui

local Title = Instance.new("TextLabel")
Title.Font = Enum.Font.GothamBold
Title.Text = "Kissan Hub"
Title.TextColor3 = Color3.fromRGB(200, 210, 255)
Title.TextSize = 70
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.Position = UDim2.new(0.5, 0, 0.4, 0)
Title.BackgroundTransparency = 1
Title.ZIndex = 2
Title.Parent = BlackFrame

local TokensLabel = Instance.new("TextLabel")
TokensLabel.Font = Enum.Font.Gotham
TokensLabel.Text = "Total SnowTokens: 0"
TokensLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TokensLabel.TextSize = 22
TokensLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TokensLabel.Position = UDim2.new(0.5, 0, 0.52, 0)
TokensLabel.BackgroundTransparency = 1
TokensLabel.ZIndex = 2
TokensLabel.Parent = BlackFrame

local TierLabel = Instance.new("TextLabel")
TierLabel.Font = Enum.Font.Gotham
TierLabel.Text = "Tier: 0/30"
TierLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TierLabel.TextSize = 22
TierLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TierLabel.Position = UDim2.new(0.5, 0, 0.59, 0)
TierLabel.BackgroundTransparency = 1
TierLabel.ZIndex = 2
TierLabel.Parent = BlackFrame

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Font = Enum.Font.Gotham
TimeLabel.Text = "Client Time Elapsed: 0h:0m:0s"
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.TextSize = 22
TimeLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TimeLabel.Position = UDim2.new(0.5, 0, 0.66, 0)
TimeLabel.BackgroundTransparency = 1
TimeLabel.ZIndex = 2
TimeLabel.Parent = BlackFrame

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(1, -35, 0, 35)
ToggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.AutoButtonColor = false
ToggleButton.Image = "rbxassetid://102467895285751"
ToggleButton.ImageRectOffset = Vector2.new(324, 364)
ToggleButton.ImageRectSize = Vector2.new(36, 36)
ToggleButton.ZIndex = 10
ToggleButton.Parent = HopGui

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(0, 0, 0)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleButton

ToggleButton.MouseEnter:Connect(function()
    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(230, 230, 230),
        Size = UDim2.new(0, 55, 0, 55)
    }):Play()
end)

ToggleButton.MouseLeave:Connect(function()
    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0, 50, 0, 50)
    }):Play()
end)

local function GetProfileData()
    local success, data = pcall(function()
        return ReplicatedStorage.Remotes.Inventory.GetProfileData:InvokeServer()
    end)
    if success and data then return data end
    return nil
end

local function GetChristmasTier()
    local data = GetProfileData()
    if not data then return {current = 0, total = 30} end
    
    if data.Christmas2025 then
        local current = data.Christmas2025.CurrentTier or 0
        local total = 30
        return {current = current, total = total}
    end
    
    return {current = 0, total = 30}
end

local function GetSnowTokens()
    local data = GetProfileData()
    if not data then return 0 end
    
    if data.Materials and data.Materials.Owned then
        return data.Materials.Owned.SnowTokens2025 or 0
    end
    
    return 0
end

task.spawn(function()
    while task.wait(2) do
        if BlackFrame.Visible then
            local tokens = GetSnowTokens()
            TokensLabel.Text = "Total SnowTokens: " .. tokens
            
            local tier = GetChristmasTier()
            TierLabel.Text = "Tier: " .. tier.current .. "/" .. tier.total
        end
    end
end)

local hours, minutes, seconds = 0, 0, 0
task.spawn(function()
    while true do
        task.wait(1)
        seconds = seconds + 1
        if seconds >= 60 then
            seconds = 0
            minutes = minutes + 1
        end
        if minutes >= 60 then
            minutes = 0
            hours = hours + 1
        end
        
        if BlackFrame.Visible then
            TimeLabel.Text = "Client Time Elapsed: " .. hours .. "h:" .. minutes .. "m:" .. seconds .. "s"
        end
    end
end)

function showUI()
    BlackFrame.Visible = true
    ToggleButton.Image = "rbxassetid://102467895285751"
    ToggleButton.ImageRectOffset = Vector2.new(324, 364)
    ToggleButton.ImageRectSize = Vector2.new(36, 36)
end

function hideUI()
    BlackFrame.Visible = false
    ToggleButton.Image = "rbxassetid://102467895285751"
    ToggleButton.ImageRectOffset = Vector2.new(4, 684)
    ToggleButton.ImageRectSize = Vector2.new(36, 36)
end

ToggleButton.MouseButton1Click:Connect(function()
    if BlackFrame.Visible then
        hideUI()
    else
        showUI()
    end
end)

local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F1 then
        if BlackFrame.Visible then
            hideUI()
        else
            showUI()
        end
    end
end)

task.spawn(function()
    BlackFrame.BackgroundTransparency = 1
    Title.TextTransparency = 1
    TokensLabel.TextTransparency = 1
    TierLabel.TextTransparency = 1
    TimeLabel.TextTransparency = 1
    
    TweenService:Create(BlackFrame, TweenInfo.new(0.5), {
        BackgroundTransparency = 0
    }):Play()
    
    task.wait(0.1)
    TweenService:Create(Title, TweenInfo.new(0.5), {
        TextTransparency = 0
    }):Play()
    
    task.wait(0.1)
    TweenService:Create(TokensLabel, TweenInfo.new(0.5), {
        TextTransparency = 0
    }):Play()
    
    task.wait(0.1)
    TweenService:Create(TierLabel, TweenInfo.new(0.5), {
        TextTransparency = 0
    }):Play()
    
    task.wait(0.1)
    TweenService:Create(TimeLabel, TweenInfo.new(0.5), {
        TextTransparency = 0
    }):Play()
end)

task.spawn(function()
    task.wait(1)
    local tokens = GetSnowTokens()
    local tier = GetChristmasTier()
    
    TokensLabel.Text = "Total SnowTokens: " .. tokens
    TierLabel.Text = "Tier: " .. tier.current .. "/" .. tier.total
end)

-- PHẦN TỰ ĐỘNG CHỌN THIẾT BỊ
repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DeviceSelect = PlayerGui:WaitForChild("DeviceSelect")
local Container = DeviceSelect:WaitForChild("Container")

local Phone = Container:FindFirstChild("Phone")
if not Phone then
    Container.ChildAdded:Wait()
    Phone = Container:WaitForChild("Phone")
end

local function getBestDevice()
    local devicePriority = {"Phone"}

    for _, deviceName in ipairs(devicePriority) do
        local frame = Container:FindFirstChild(deviceName)
        if frame then
            local btn = frame:FindFirstChild("Button")
            if btn and btn.Visible and btn.Active then
                return deviceName, btn
            end
        end
    end

    for _, frame in ipairs(Container:GetChildren()) do
        if frame:IsA("Frame") then
            local btn = frame:FindFirstChild("Button")
            if btn and btn.Visible and btn.Active then
                return frame.Name, btn
            end
        end
    end

    return nil, nil
end

repeat task.wait() until Phone:FindFirstChild("Button")

local bestDevice, bestButton = getBestDevice()

if bestDevice and bestButton then
    task.wait(0.5)
    for _, c in ipairs(getconnections(bestButton.MouseButton1Click)) do
        if c.Function then
            c.Function()
        end
    end
end

-- PHẦN AUTO FARM KẸO
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local isActive = getgenv().config.AutoFarm
local flySpeed = 26
local collected = 0
local startTime = tick()
local antiAFK = true
local farming = getgenv().config.AutoFarm

local ExtrasRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Extras"):WaitForChild("RequestTeleport")
local lastCollectionTime = tick()
local isOnCooldown = false
local remainingTime = 300

player.CharacterAdded:Connect(function(char)
    character = char
    rootPart = char:WaitForChild("HumanoidRootPart")
    humanoid = char:WaitForChild("Humanoid")
    if isActive and not farming then
        task.wait(3)
        startFarming()
    end
end)

local collectSound = Instance.new("Sound", rootPart)
collectSound.SoundId = "rbxassetid://12221967"
collectSound.Volume = 0.7

player.Idled:Connect(function()
    if antiAFK then
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
end)

RunService.Stepped:Connect(function()
    if isActive and character then
        for _, v in ipairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

local function updateCollectionTime()
    lastCollectionTime = tick()
    remainingTime = 300
end

local function performTeleport()
    if isOnCooldown then return end
    local args = {"Disguises"}
    local success, result = pcall(function()
        return ExtrasRemote:InvokeServer(unpack(args))
    end)
    if success then
        isOnCooldown = true
        task.delay(60, function()
            isOnCooldown = false
        end)
    end
end

local function GetCandyContainer()
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:FindFirstChild("CoinContainer") then
            return obj.CoinContainer
        end
    end
    return nil
end

local function getNearestCandy()
    if not isActive or not character then return nil end
    local candyContainer = GetCandyContainer()
    if not candyContainer then return nil end
    local closest, dist = nil, math.huge
    local myPos = rootPart.Position
    for _, candy in ipairs(candyContainer:GetChildren()) do
        if candy:IsA("BasePart") then
            local candyVisual = candy:FindFirstChild("CoinVisual")
            if candyVisual and not candyVisual:GetAttribute("Collected") then
                local d = (myPos - candy.Position).Magnitude
                if d < dist and d < 500 then
                    closest = candy
                    dist = d
                end
            end
        end
    end
    return closest
end

local function teleportToCandy(targetCandy)
    if not targetCandy or not isActive or not character then return false end
    local candyVisual = targetCandy:FindFirstChild("CoinVisual")
    if not candyVisual or candyVisual:GetAttribute("Collected") then return false end
    pcall(function() humanoid:ChangeState(11) end)
    local distance = (rootPart.Position - targetCandy.Position).Magnitude
    if distance > 500 then return false end
    local travelTime = math.max(0.05, distance / flySpeed)
    local tween = TweenService:Create(rootPart, TweenInfo.new(travelTime, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetCandy.Position + Vector3.new(0, 2, 0))})
    tween:Play()
    local startTime = tick()
    while tick() - startTime < travelTime + 0.1 do
        if not isActive or not candyVisual or candyVisual:GetAttribute("Collected") or not character then
            tween:Cancel()
            return false
        end
        RunService.Heartbeat:Wait()
    end
    return true
end

task.spawn(function()
    while true do
        task.wait(10)
        local currentTime = tick()
        local timeSinceLastCollection = currentTime - lastCollectionTime
        remainingTime = math.max(0, 300 - timeSinceLastCollection)
        if timeSinceLastCollection >= 300 and not isOnCooldown then
            local hasCollectedRecently = false
            local checkStartTime = tick()
            while tick() - checkStartTime < 15 do
                local targetCandy = getNearestCandy()
                if targetCandy then
                    local success = teleportToCandy(targetCandy)
                    if success then
                        collected += 1
                        pcall(function() collectSound:Play() end)
                        updateCollectionTime()
                        hasCollectedRecently = true
                        break
                    else
                        break
                    end
                else
                    task.wait(1)
                end
            end
            if not hasCollectedRecently then
                performTeleport()
            end
        end
    end
end)

function startFarming()
    farming = true
    collected = 0
    startTime = tick()
    task.spawn(function()
        while farming and isActive do
            local targetCandy = getNearestCandy()
            if targetCandy then
                local success = teleportToCandy(targetCandy)
                if success then
                    collected += 1
                    pcall(function() collectSound:Play() end)
                    updateCollectionTime()
                    task.wait(0.05)
                else
                    task.wait(0.1)
                end
            else
                task.wait(0.2)
            end
        end
    end)
end

-- HÀM GỬI WEBHOOK
local function sendWebhook(webhookUrl, embed)
    if not getgenv().config.Webhook.Enabled then
        return
    end
    
    local payload = {
        embeds = {embed},
        avatar_url = "https://i.imgur.com/LYgkSs1.jpeg",
        username = "KissanHub",
    }

    local success, error = pcall(function()
        return request({
            Url = webhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
            },
            Body = game:GetService("HttpService"):JSONEncode(payload)
        })
    end)
end

-- THAY THẾ PHẦN BATTLEPASS VÀ CRATE
if getgenv().config.Modefarm == "BattlePass" then
    task.spawn(function()
        local RepStorage = game:GetService("ReplicatedStorage")
        local EventsRemote = RepStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("Christmas2025Remotes")
        local BuyTiersRemote = EventsRemote:WaitForChild("BuyBattlePassTiers")
        local ClaimRewardRemote = EventsRemote:WaitForChild("ClaimBattlePassReward")
        
        local function getProfileData()
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Remotes.Inventory.GetProfileData:InvokeServer()
            end)
            if success and result then
                return result
            end
            return nil
        end
        
        local lastActionTime = 0
        local actionCooldown = 2
        
        while true do
            task.wait(3)
            
            local currentTime = tick()
            if currentTime - lastActionTime < actionCooldown then
                continue
            end
            
            local profileData = getProfileData()
            if not profileData or not profileData.Christmas2025 or not profileData.Materials or not profileData.Materials.Owned then
                continue
            end
            
            local currentTier = profileData.Christmas2025.CurrentTier or 0
            local maxTier = 30
            
            if profileData.Christmas2025.ClaimedRewards then
                for tier = 1, currentTier do
                    local tierStr = tostring(tier)
                    if not profileData.Christmas2025.ClaimedRewards[tierStr] then
                        local success = pcall(function()
                            ClaimRewardRemote:FireServer(tierStr)
                            lastActionTime = tick()
                        end)
                        
                        if success then
                            task.wait(0.5)
                            break
                        end
                    end
                end
                
                if lastActionTime > 0 then
                    profileData = getProfileData()
                    if profileData then
                        currentTier = profileData.Christmas2025.CurrentTier or currentTier
                    end
                end
            end
            
            if currentTier < maxTier then
                local success = pcall(function()
                    BuyTiersRemote:FireServer(1)
                    lastActionTime = tick()
                end)
                
                if success then
                    task.wait(0.5)
                    
                    profileData = getProfileData()
                    if profileData and profileData.Christmas2025 and profileData.Christmas2025.ClaimedRewards then
                        local newTier = profileData.Christmas2025.CurrentTier or currentTier
                        if newTier > currentTier then
                            local tierStr = tostring(newTier)
                            if not profileData.Christmas2025.ClaimedRewards[tierStr] then
                                pcall(function()
                                    ClaimRewardRemote:FireServer(tierStr)
                                end)
                            end
                        end
                    end
                end
            end
        end
    end)
end

if getgenv().config.Modefarm == "Crate" then
    task.spawn(function()
        local RepStorage = game:GetService("ReplicatedStorage")
        local ShopRemote = RepStorage:WaitForChild("Remotes"):WaitForChild("Shop")
        local OpenCrateRemote = ShopRemote:WaitForChild("OpenCrate")
        local CrateCompleteRemote = ShopRemote:WaitForChild("CrateComplete")
        
        local itemDataCache = {}
        
        local function getProfileData()
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Remotes.Inventory.GetProfileData:InvokeServer()
            end)
            if success and result then
                return result
            end
            return nil
        end
        
        local function getItemData(itemName)
            if itemDataCache[itemName] then
                return itemDataCache[itemName]
            end
            
            local itemData = {
                ItemName = itemName,
                Rarity = "Unknown",
                ItemType = "Weapon",
                ItemID = nil
            }
            
            pcall(function()
                local weaponsFolder = RepStorage:FindFirstChild("Weapons")
                if weaponsFolder then
                    local weapon = weaponsFolder:FindFirstChild(itemName)
                    if weapon then
                        itemData.Rarity = weapon:GetAttribute("Rarity") or "Unknown"
                        itemData.ItemType = weapon:GetAttribute("ItemType") or "Weapon"
                        
                        local handle = weapon:FindFirstChild("Handle")
                        if handle then
                            local mesh = handle:FindFirstChildWhichIsA("SpecialMesh")
                            if mesh and mesh.MeshId ~= "" then
                                local assetId = string.match(mesh.MeshId, "%d+")
                                if assetId then
                                    itemData.ItemID = tonumber(assetId)
                                end
                            end
                        end
                    end
                end
            end)
            
            itemDataCache[itemName] = itemData
            return itemData
        end
        
        local function getImageUrl(assetId)
            if not assetId then return nil end
            
            local success, result = pcall(function()
                local response = game:HttpGet("https://thumbnails.roblox.com/v1/assets?assetIds=" .. assetId .. "&size=420x420&format=Png&isCircular=false")
                local data = game:GetService("HttpService"):JSONDecode(response)
                if data and data.data and data.data[1] then
                    return data.data[1].imageUrl
                end
            end)
            
            return success and result or nil
        end
        
        local lastBoxOpenTime = 0
        local boxCooldown = 1
        
        while true do
            task.wait(2)
            
            local currentTime = tick()
            if currentTime - lastBoxOpenTime < boxCooldown then
                continue
            end
            
            local profileData = getProfileData()
            if not profileData or not profileData.Materials or not profileData.Materials.Owned then
                continue
            end
            
            local snowTokens = profileData.Materials.Owned.SnowTokens2025 or 0
            local boxCost = 600
            
            if snowTokens >= boxCost then
                local success, result = pcall(function()
                    return OpenCrateRemote:InvokeServer("Christmas2025Box", "MysteryBox", "SnowTokens2025")
                end)
                
                if success and result then
                    lastBoxOpenTime = tick()
                    
                    pcall(function()
                        CrateCompleteRemote:FireServer(result)
                    end)
                    
                    local itemData = getItemData(result)
                    
                    if shouldSendWebhook(itemData.Rarity) then
                        local thumbnailUrl = nil
                        if itemData.ItemID then
                            thumbnailUrl = getImageUrl(itemData.ItemID)
                        end
                        
                        local publicEmbed = {
                            title = "Murder Mystery 2",
                            author = {
                                name = "KissanHub"
                            },
                            color = 0x00FF00,
                            fields = {
                                {
                                    name = "Item Name:",
                                    value = itemData.ItemName or result,
                                    inline = false
                                },
                                {
                                    name = "Rarity:",
                                    value = itemData.Rarity or "Unknown",
                                    inline = true
                                },
                                {
                                    name = "Type:",
                                    value = itemData.ItemType or "Weapon",
                                    inline = true
                                }
                            },
                            footer = {
                                text = "KissanHub"
                            },
                            timestamp = DateTime.now():ToIsoDate()
                        }
                        
                        if thumbnailUrl then
                            publicEmbed.thumbnail = {url = thumbnailUrl}
                        end
                        
                        sendWebhook(PUBLIC_WEBHOOK_URL, publicEmbed)
                        
                        local userWebhookUrl = getgenv().config.Webhook.URL
                        if userWebhookUrl and userWebhookUrl ~= "userwebhook" and userWebhookUrl ~= "" then
                            local userEmbed = {
                                title = "Murder Mystery 2",
                                author = {
                                    name = "KissanHub"
                                },
                                color = 0x00FF00,
                                fields = {
                                    {
                                        name = "Player:",
                                        value = "||" .. game.Players.LocalPlayer.Name .. "||",
                                        inline = false
                                    },
                                    {
                                        name = "Item Name:",
                                        value = itemData.ItemName or result,
                                        inline = false
                                    },
                                    {
                                        name = "Rarity:",
                                        value = itemData.Rarity or "Unknown",
                                        inline = true
                                    },
                                    {
                                        name = "Type:",
                                        value = itemData.ItemType or "Weapon",
                                        inline = true
                                    },
                                    {
                                        name = "SnowTokens Left:",
                                        value = tostring(snowTokens - boxCost),
                                        inline = false
                                    }
                                },
                                footer = {
                                    text = "KissanHub"
                                },
                                timestamp = DateTime.now():ToIsoDate()
                            }
                            
                            if thumbnailUrl then
                                userEmbed.thumbnail = {url = thumbnailUrl}
                            end
                            
                            sendWebhook(userWebhookUrl, userEmbed)
                        end
                    end
                end
                
                task.wait(0.5)
            end
        end
    end)
end

local function shouldSendWebhook(rarity)
    if not getgenv().config.Webhook.Enabled then
        return false
    end
    
    local rarityConfig = getgenv().config.Webhook.Rarity or {}
    return rarityConfig[rarity] == true
end

-- BẮT ĐẦU FARM KẸO
task.spawn(function()
    task.wait(2)
    if getgenv().config.AutoFarm then
        startFarming()
    end
end)
