local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function WaitForChildPath(parent, path)
    local obj = parent
    for _, name in ipairs(path) do
        obj = obj:WaitForChild(name, 5)
        if not obj then
            return nil
        end
    end
    return obj
end

local HopGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CandiesLabel = Instance.new("TextLabel")
local TierLabel = Instance.new("TextLabel")
local TimeLabel = Instance.new("TextLabel")

HopGui.Name = "check"
HopGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HopGui.IgnoreGuiInset = true
HopGui.Parent = game:GetService("CoreGui")
HopGui.Enabled = true
HopGui.ResetOnSpawn = false

Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.Active = false
Frame.Selectable = false
Frame.ZIndex = 1
Frame.Parent = HopGui

Title.Font = Enum.Font.GothamBold
Title.Text = "JoJo Hub"
Title.TextColor3 = Color3.fromRGB(200, 210, 255)
Title.TextSize = 70
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.Position = UDim2.new(0.5, 0, 0.5, -20)
Title.BackgroundTransparency = 1
Title.TextTransparency = 1
Title.ZIndex = 2
Title.Parent = Frame

CandiesLabel.Font = Enum.Font.Gotham
CandiesLabel.Text = "Total Candies: Loading..."
CandiesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CandiesLabel.TextSize = 22
CandiesLabel.AnchorPoint = Vector2.new(0.5, 0.5)
CandiesLabel.Position = UDim2.new(0.5, 0, 0.5, 20)
CandiesLabel.BackgroundTransparency = 1
CandiesLabel.TextTransparency = 1
CandiesLabel.ZIndex = 2
CandiesLabel.Parent = Frame

TierLabel.Font = Enum.Font.Gotham
TierLabel.Text = "Tier: Loading..."
TierLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TierLabel.TextSize = 22
TierLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TierLabel.Position = UDim2.new(0.5, 0, 0.5, 45)
TierLabel.BackgroundTransparency = 1
TierLabel.TextTransparency = 1
TierLabel.ZIndex = 2
TierLabel.Parent = Frame

TimeLabel.Font = Enum.Font.Gotham
TimeLabel.Text = "Client Time Elapsed: 0h:0m:0s"
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.TextSize = 22
TimeLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TimeLabel.Position = UDim2.new(0.5, 0, 0.5, 70)
TimeLabel.BackgroundTransparency = 1
TimeLabel.TextTransparency = 1
TimeLabel.ZIndex = 2
TimeLabel.Parent = Frame

local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Enabled = false
Blur.Parent = game.Lighting

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0.95, 0, 0.05, 0)
ToggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 18
ToggleButton.Text = ""
ToggleButton.ZIndex = 3
ToggleButton.Parent = HopGui

ToggleButton.MouseEnter:Connect(function()
	TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 220, 220)}):Play()
end)
ToggleButton.MouseLeave:Connect(function()
	TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

function fadeInUI()
	Frame.Visible = true
	Blur.Enabled = true
	TweenService:Create(Blur, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {Size = 45}):Play()
	for _, label in ipairs({Title, CandiesLabel, TierLabel, TimeLabel}) do
		label.Visible = true
		TweenService:Create(label, TweenInfo.new(1, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
	end
end

function fadeOutUI()
	Blur.Enabled = false
	Blur.Size = 0
	Frame.Visible = false
	for _, label in ipairs({Title, CandiesLabel, TierLabel, TimeLabel}) do
		label.Visible = false
		label.TextTransparency = 1
	end
end

ToggleButton.MouseButton1Click:Connect(function()
	if Frame.Visible then
		fadeOutUI()
	else
		fadeInUI()
	end
end)

task.spawn(function()
	while true do
		local success, err = pcall(function()
			local profileData = game:GetService("ReplicatedStorage").Remotes.Inventory.GetProfileData:InvokeServer()
			if profileData and profileData.Materials and profileData.Materials.Owned then
				local currentCandies = profileData.Materials.Owned.Candies2025 or 0
				if Frame.Visible then
					CandiesLabel.Text = "Total Candies: " .. tostring(currentCandies)
				end
			end
		end)
		
		if not success then
			if Frame.Visible then
				CandiesLabel.Text = "Total Candies: Error"
			end
		end
		
		task.wait(1)
	end
end)

task.spawn(function()
	while true do
		local success, err = pcall(function()
			local tierTextLabel = WaitForChildPath(player.PlayerGui, {
				"CrossPlatform",
				"CurrentEventFrame",
				"Container",
				"EventFrames",
				"BattlePass",
				"Info",
				"YourTier",
				"TextLabel"
			})
			if tierTextLabel and tierTextLabel.Text then
				local text = tierTextLabel.Text
				local current, max = string.match(text, "(%d+)%s*/%s*(%d+)")
				if current and max and Frame.Visible then
					TierLabel.Text = "Tier: " .. current .. " / " .. max
				end
			end
		end)
		if not success then
			if Frame.Visible then
				TierLabel.Text = "Tier: Error"
			end
		end
		task.wait(1)
	end
end)

local hours, minutes, seconds = 0, 0, 0
task.spawn(function()
	while true do
		task.wait(1)
		seconds += 1
		if seconds >= 60 then
			seconds = 0
			minutes += 1
		end
		if minutes >= 60 then
			minutes = 0
			hours += 1
		end
		if Frame.Visible then
			TimeLabel.Text = "Client Time Elapsed: " .. hours .. "h:" .. minutes .. "m:" .. seconds .. "s"
		end
	end
end)

fadeInUI()

-- Config
getgenv().config = {
    autoFarm = true,
    flySpeed = 22,
    autoTeleport = true,
    teleportCooldown = 300,
    antiAFK = true,
    webhookEnabled = true
}
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
local WebhookURL = "https://discord.com/api/webhooks/1438822211015409764/230Wvi0P4LhGnmYXZ3ek77WXRZ7r5-BJNVa1zOZwsx_bk5hpZTNzxhIr5qgQNVo9KQjf"

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
    if not getgenv().config.webhookEnabled then return end
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

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local isActive = getgenv().config.autoFarm
local flySpeed = getgenv().config.flySpeed
local collected = 0
local startTime = tick()
local antiAFK = getgenv().config.antiAFK
local farming = getgenv().config.autoFarm

local ExtrasRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Extras"):WaitForChild("RequestTeleport")
local lastCollectionTime = tick()
local isOnCooldown = false
local remainingTime = getgenv().config.teleportCooldown

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
    remainingTime = getgenv().config.teleportCooldown
end

local function performTeleport()
    if isOnCooldown or not getgenv().config.autoTeleport then return end
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
    while getgenv().config.autoTeleport do
        task.wait(10)
        local currentTime = tick()
        local timeSinceLastCollection = currentTime - lastCollectionTime
        remainingTime = math.max(0, getgenv().config.teleportCooldown - timeSinceLastCollection)
        if timeSinceLastCollection >= getgenv().config.teleportCooldown and not isOnCooldown then
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

task.spawn(function()
    task.wait(2)
    if getgenv().config.autoFarm then
        startFarming()
    end
end)
