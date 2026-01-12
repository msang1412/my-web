local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local SC_UI_Name = "PrivateNotify_v1"
local existingUI = game:GetService("CoreGui"):FindFirstChild(SC_UI_Name)

if existingUI then
    existingUI:Destroy()
end

function Tween(object,time,easingstyle,easingdirection,properties)
    return TweenService:Create(object,TweenInfo.new(time, easingstyle, easingdirection),properties)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = SC_UI_Name
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local NotificationContainer = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

NotificationContainer.Name = "NotificationContainer"
NotificationContainer.Parent = ScreenGui
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.BorderSizePixel = 0
NotificationContainer.Position = UDim2.new(1, 0, 0, 0)
NotificationContainer.Size = UDim2.new(0, 0, 0.97, 0)

UIListLayout.Parent = NotificationContainer
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 15)

local ImageAssets = {
    NotifyDetail = "rbxassetid://14184951412",
    NotifyIcon = "rbxassetid://3926307971",
    NotifyPaimon = "rbxassetid://14480278865",
}

function Notify(Configs)
    Configs = Configs or {}
    Configs.Text = Configs.Text or "Notification"
    Configs.Delay = Configs.Delay or 3
    Configs.Type2 = Configs.Type2 or "Default"
    
    local NotifyFrame = Instance.new("Frame")
    local NotifyMain = Instance.new("Frame")
    local NotifyText = Instance.new("TextLabel")
    local NotifyDetail = Instance.new("ImageLabel")
    local CloseButton = Instance.new("ImageButton")
    local IconFrame = Instance.new("Frame")
    local IconLabel = Instance.new("TextLabel")
    local IconImage = Instance.new("ImageLabel")
    local ProgressBarBG = Instance.new("Frame")
    local ProgressBar = Instance.new("Frame")
    local UIStroke = Instance.new("UIStroke")
    
    NotifyFrame.Name = "NotifyFrame"
    NotifyFrame.Parent = NotificationContainer
    NotifyFrame.BackgroundTransparency = 1
    NotifyFrame.Size = UDim2.new(0, 300, 0, 50)
    
    NotifyMain.Name = "NotifyMain"
    NotifyMain.Parent = NotifyFrame
    NotifyMain.BackgroundColor3 = Color3.fromRGB(15, 15, 14)
    NotifyMain.BackgroundTransparency = 0.35
    NotifyMain.BorderSizePixel = 0
    NotifyMain.Position = UDim2.new(3, -300, 0, 0)
    NotifyMain.Size = UDim2.new(1, 0, 1, 0)
    NotifyMain.ClipsDescendants = true
    
    local textSize = TextService:GetTextSize(Configs.Text, 22, Enum.Font.Fantasy, Vector2.new(500, 100))
    local frameWidth = math.max(300, textSize.X + 150)
    
    NotifyFrame.Size = UDim2.new(0, frameWidth, 0, 50)
    NotifyMain.Size = UDim2.new(1, 0, 1, 0)
    NotifyMain.Position = UDim2.new(3, -frameWidth, 0, 0)
    
    NotifyText.Name = "NotifyText"
    NotifyText.Parent = NotifyMain
    NotifyText.BackgroundTransparency = 1
    NotifyText.Position = UDim2.new(0, 75, 0.2, 0)
    NotifyText.Size = UDim2.new(1, -110, 0.6, 0)
    NotifyText.Font = Enum.Font.Fantasy
    NotifyText.RichText = true
    NotifyText.Text = "<b>"..Configs.Text.."</b>"
    NotifyText.TextColor3 = Color3.fromRGB(236, 229, 216)
    NotifyText.TextSize = 22
    NotifyText.TextWrapped = true
    NotifyText.TextXAlignment = Enum.TextXAlignment.Left
    
    NotifyDetail.Name = "NotifyDetail"
    NotifyDetail.Parent = NotifyMain
    NotifyDetail.BackgroundTransparency = 1
    NotifyDetail.Position = UDim2.new(0, -25, 0, 0)
    NotifyDetail.Size = UDim2.new(0, 25, 1, 0)
    NotifyDetail.Image = ImageAssets.NotifyDetail
    NotifyDetail.ImageColor3 = Color3.fromRGB(15, 15, 14)
    NotifyDetail.ImageTransparency = 0.35
    
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = NotifyMain
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(1, -30, 0.22, 0)
    CloseButton.Size = UDim2.new(0, 20, 0, 25)
    CloseButton.ZIndex = 3
    CloseButton.Image = ImageAssets.NotifyIcon
    CloseButton.ImageColor3 = Color3.fromRGB(236, 229, 216)
    CloseButton.ImageRectOffset = Vector2.new(764, 244)
    CloseButton.ImageRectSize = Vector2.new(36, 36)
    
    IconFrame.Name = "IconFrame"
    IconFrame.Parent = NotifyMain
    IconFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    IconFrame.BackgroundTransparency = 0.55
    IconFrame.BorderSizePixel = 0
    IconFrame.Position = UDim2.new(0, 10, 0, -5)
    IconFrame.Rotation = 45
    IconFrame.Size = UDim2.new(0, 50, 0, 50)
    
    UIStroke.Parent = IconFrame
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Thickness = 2
    UIStroke.Color = Color3.fromRGB(236, 229, 216)
    UIStroke.Enabled = false
    
    IconImage.Name = "IconImage"
    IconImage.Parent = IconFrame
    IconImage.BackgroundTransparency = 1
    IconImage.Position = UDim2.new(-0.1, -1, -0.1, -1)
    IconImage.Rotation = -45
    IconImage.Size = UDim2.new(1.2, 2, 1.2, 2)
    IconImage.Image = ImageAssets.NotifyPaimon
    IconImage.Visible = false
    
    IconLabel.Name = "IconLabel"
    IconLabel.Parent = IconFrame
    IconLabel.BackgroundTransparency = 1
    IconLabel.Rotation = -45
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.Font = Enum.Font.FredokaOne
    IconLabel.Text = "!"
    IconLabel.TextColor3 = Color3.fromRGB(255, 74, 74)
    IconLabel.TextScaled = true
    IconLabel.Visible = false
    
    if Configs.Type2 == "Paimon" then
        IconImage.Visible = true
        UIStroke.Enabled = true
        IconFrame.BackgroundColor3 = Color3.fromRGB(159, 154, 145)
        IconFrame.BackgroundTransparency = 0
    else
        IconLabel.Visible = true
    end
    
    ProgressBarBG.Name = "ProgressBarBG"
    ProgressBarBG.Parent = NotifyMain
    ProgressBarBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ProgressBarBG.BorderSizePixel = 0
    ProgressBarBG.BackgroundTransparency = 1
    ProgressBarBG.Position = UDim2.new(0, 45, 1, -2)
    ProgressBarBG.Size = UDim2.new(1, -45, 0, 2)
    
    ProgressBar.Name = "ProgressBar"
    ProgressBar.Parent = ProgressBarBG
    ProgressBar.BackgroundColor3 = Color3.fromRGB(236, 229, 216)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Size = UDim2.new(1, 0, 1, 0)
    
    local inTween = Tween(NotifyMain, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {
        Position = UDim2.new(1, -frameWidth, 0, 0)
    })
    inTween:Play()
    
    if Configs.Delay and Configs.Delay > 0 then
        local progressTween = Tween(ProgressBar, Configs.Delay, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, {
            Size = UDim2.new(0, 0, 1, 0),
            Position = UDim2.new(1, 0, 0, 0)
        })
        progressTween:Play()
        
        progressTween.Completed:Connect(function()
            local outTween = Tween(NotifyMain, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In, {
                Position = UDim2.new(3, -frameWidth, 0, 0)
            })
            outTween:Play()
            outTween.Completed:Connect(function()
                NotifyFrame:Destroy()
            end)
        end)
    end
    
    CloseButton.MouseButton1Click:Connect(function()
        local outTween = Tween(NotifyMain, 0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In, {
            Position = UDim2.new(3, -frameWidth, 0, 0)
        })
        outTween:Play()
        outTween.Completed:Connect(function()
            NotifyFrame:Destroy()
        end)
    end)
    
    return NotifyFrame
end

getgenv().Notify = Notify

return Notify
