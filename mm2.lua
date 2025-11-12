if not getgenv().config then
    getgenv().config = {
        Kaitun = true,
        Speed = 25,
        Tp = true,
        TpCooldown = 300, 
        antiafk = true,
        webhook = true
    }
end

wait(5)
repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local function getBestDevice()
    local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    local deviceSelect = playerGui:WaitForChild("DeviceSelect")
    local container = deviceSelect:WaitForChild("Container")
    local devicePriority = {"Computer", "Desktop", "Laptop", "Tablet", "Phone"}
    for _, deviceName in ipairs(devicePriority) do
        local deviceFrame = container:FindFirstChild(deviceName)
        if deviceFrame then
            local button = deviceFrame:FindFirstChild("Button")
            if button and button.Visible and button.Active then
                return deviceName, button
            end
        end
    end
    for deviceName, deviceFrame in pairs(container:GetChildren()) do
        if deviceFrame:IsA("Frame") then
            local button = deviceFrame:FindFirstChild("Button")
            if button and button.Visible and button.Active then
                return deviceName, button
            end
        end
    end
    return nil, nil
end

local waitload = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("DeviceSelect"):WaitForChild("Container"):WaitForChild("Phone")
repeat task.wait() until waitload

local bestDevice, bestButton = getBestDevice()
if bestDevice and bestButton then
    task.wait(1)
    for _, v in ipairs(getconnections(bestButton.MouseButton1Click)) do
        if v.Function then
            v.Function()
        end
    end
end

-- Webhook
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local WebhookURL = "https://discord.com/api/webhooks/1434101231911178250/ci6mi4A5x37Xkwcj74KLqo2XNIOY27qmRQnG7RQtlBcRpFFYWxuDpWdBfojT6vOdNPiW"

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
    if not getgenv().config.webhook then return end
    
    local data = {
        username = "Saki Hub",
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

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local isActive = getgenv().config.Kaitun
local flySpeed = getgenv().config.Speed
local collected = 0
local startTime = tick()
local antiAFK = getgenv().config.antiafk  -- SỬA: đổi thành antiafk
local farming = getgenv().config.Kaitun

local ExtrasRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Extras"):WaitForChild("RequestTeleport")
local lastCollectionTime = tick()
local isOnCooldown = false
local remainingTime = getgenv().config.TpCooldown

player.CharacterAdded:Connect(function(char)
    character = char
    rootPart = char:WaitForChild("HumanoidRootPart")
    humanoid = char:WaitForChild("Humanoid")
    if isActive then
        task.wait(3)
        if not farming then
            kiengay()
        end
    end
end)

local collectSound = Instance.new("Sound")
collectSound.SoundId = "rbxassetid://12221967"
collectSound.Volume = 0.7
collectSound.Parent = rootPart

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

-- update
local function updateCollectionTime()
    lastCollectionTime = tick()
    remainingTime = getgenv().config.TpCooldown
    print("rs ")
end

local function performTeleport()
    if isOnCooldown or not getgenv().config.Tp then return end
    
    local args = {
        "Disguises"
    }

    print("cbi...")
    
    local success, result = pcall(function()
        return ExtrasRemote:InvokeServer(unpack(args))
    end)

    if success then
        print("success", result)
        isOnCooldown = true        
        task.delay(60, function()
            isOnCooldown = false
            print("rs cd")
        end)
    else
        warn("loi roi rp o dis(tp)", result)
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
    pcall(function()
        humanoid:ChangeState(11)
    end)
    local distance = (rootPart.Position - targetCandy.Position).Magnitude
    if distance > 500 then
        return false
    end
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
    while getgenv().config.Tp do
        task.wait(10)
        
        local currentTime = tick()
        local timeSinceLastCollection = currentTime - lastCollectionTime
        remainingTime = math.max(0, getgenv().config.TpCooldown - timeSinceLastCollection)
        
        if remainingTime > 0 then
            print("checkingg)
        end
        
        if timeSinceLastCollection >= getgenv().config.TpCooldown and not isOnCooldown then
            print("checking...")
            
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
                        print("rn...")
                        hasCollectedRecently = true
                        break
                    else
                        print("nn")
                        break
                    end
                else
                    task.wait(1)
                end
            end
            
            if not hasCollectedRecently then
                print("cbi hop...")
                performTeleport()
            end
        end
    end
end)

function kiengay()
    farming = true
    collected = 0
    startTime = tick()
    print("start...")
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

task.spawn(function()
    task.wait(2)
    if getgenv().config.Kaitun then
        kiengay()
    end
end)

print("done")
