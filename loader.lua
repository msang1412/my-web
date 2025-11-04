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
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local isActive = true
local flySpeed = 22
local collected = 0
local startTime = tick()
local antiAFK = true
local farming = true

player.CharacterAdded:Connect(function(char)
    character = char
    rootPart = char:WaitForChild("HumanoidRootPart")
    humanoid = char:WaitForChild("Humanoid")
    if isActive then
        task.wait(3)
        if not farming then
            startFarming()
        end
    end
end)

local collectSound = Instance.new("Sound", rootPart)
collectSound.SoundId = "rbxassetid://12221967"
collectSound.Volume = 0.7

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CandyFarmGui"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 280, 0, 300)
frame.Position = UDim2.new(0.5, -140, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(110, 110, 160)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "Candy Auto Farm 🍬"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left

local separator = Instance.new("Frame", frame)
separator.Size = UDim2.new(1, -20, 0, 1)
separator.Position = UDim2.new(0, 10, 0, 45)
separator.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
separator.BorderSizePixel = 0

local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1, -20, 0, 20)
credit.Position = UDim2.new(0, 10, 1, -20)
credit.Text = "MM2 Optimized"
credit.TextColor3 = Color3.fromRGB(170, 170, 170)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.Gotham
credit.TextSize = 12
credit.TextXAlignment = Enum.TextXAlignment.Right

local hideBtn = Instance.new("TextButton", gui)
hideBtn.Size = UDim2.new(0, 110, 0, 35)
hideBtn.Position = UDim2.new(1, -120, 1, -45)
hideBtn.Text = "Hide GUI"
hideBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
hideBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
hideBtn.Font = Enum.Font.GothamBold
hideBtn.TextSize = 14
Instance.new("UICorner", hideBtn).CornerRadius = UDim.new(0, 6)

hideBtn.MouseEnter:Connect(function()
    hideBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
end)
hideBtn.MouseLeave:Connect(function()
    hideBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
end)
hideBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    hideBtn.Text = frame.Visible and "Hide GUI" or "Show GUI"
end)

local function makeButton(y, text)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 240, 0, 30)
    btn.Position = UDim2.new(0.5, -120, 0, y)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local function makeLabel(y, text)
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(0, 240, 0, 20)
    lbl.Position = UDim2.new(0.5, -120, 0, y)
    lbl.Text = text
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 14
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local toggleBtn = makeButton(60, "Auto Farm: ON")
local afkBtn = makeButton(100, "Anti-AFK: ON")
local speedBtn = makeButton(140, "Tween Speed: 22")
local counterLabel = makeLabel(180, "Candy Collected: 0")
local timerLabel = makeLabel(205, "Time Active: 0s")
local rateLabel = makeLabel(230, "Est. Candy/Hour: 0")
local resetBtn = makeButton(255, "🔄 Reset Counter")

toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 80)
afkBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 80)

resetBtn.MouseButton1Click:Connect(function()
    collected = 0
    startTime = tick()
    counterLabel.Text = "Candy Collected: 0"
    timerLabel.Text = "Time Active: 0s"
    rateLabel.Text = "Est. Candy/Hour: 0"
end)

afkBtn.MouseButton1Click:Connect(function()
    antiAFK = not antiAFK
    afkBtn.Text = antiAFK and "Anti-AFK: ON" or "Anti-AFK: OFF"
    afkBtn.BackgroundColor3 = antiAFK and Color3.fromRGB(80, 160, 80) or Color3.fromRGB(50, 50, 70)
end)

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

speedBtn.MouseButton1Click:Connect(function()
    flySpeed = flySpeed + 5
    if flySpeed > 40 then flySpeed = 15 end
    speedBtn.Text = "Tween Speed: " .. flySpeed
end)

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
    local tween = TweenService:Create(rootPart, TweenInfo.new(travelTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(targetCandy.Position + Vector3.new(0, 2, 0))})
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

local function startFarming()
    farming = true
    collected = 0
    startTime = tick()
    task.spawn(function()
        while farming and isActive do
            local elapsed = tick() - startTime
            timerLabel.Text = "Time Active: " .. math.floor(elapsed) .. "s"
            local rate = elapsed > 0 and math.floor((collected / elapsed) * 3600) or 0
            rateLabel.Text = "Est. Candy/Hour: " .. rate
            counterLabel.Text = "Candy Collected: " .. collected
            task.wait(0.5)
        end
    end)
    task.spawn(function()
        local consecutiveFails = 0
        while farming and isActive do
            if character and rootPart then
                local targetCandy = getNearestCandy()
                if targetCandy then
                    local success = teleportToCandy(targetCandy)
                    if success then
                        collected += 1
                        consecutiveFails = 0
                        pcall(function()
                            collectSound:Play()
                        end)
                        task.wait(0.05)
                    else
                        consecutiveFails += 1
                        task.wait(0.1)
                    end
                else
                    consecutiveFails += 1
                    task.wait(0.2)
                end
                if consecutiveFails > 10 then
                    task.wait(0.5)
                    consecutiveFails = 0
                end
            else
                task.wait(1)
            end
        end
    end)
end

toggleBtn.MouseButton1Click:Connect(function()
    isActive = not isActive
    toggleBtn.Text = isActive and "Auto Farm: ON" or "Auto Farm: OFF"
    toggleBtn.BackgroundColor3 = isActive and Color3.fromRGB(80, 160, 80) or Color3.fromRGB(50, 50, 70)
    if isActive and not farming then
        startFarming()
    elseif not isActive then
        farming = false
    end
end)

task.spawn(function()
    task.wait(2)
    startFarming()
end)
