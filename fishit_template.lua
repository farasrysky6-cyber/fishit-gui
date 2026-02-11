--[[ 
    Fish It - GUI Template
    Ready for loadstring (Delta Executor)
]]

-- Anti double execute
if game.CoreGui:FindFirstChild("FishItGUI") then
    game.CoreGui.FishItGUI:Destroy()
end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FishItGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 340, 0, 260)
Main.Position = UDim2.new(0.35, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
Main.Active = true
Main.Draggable = true
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

-- Title Bar
local Top = Instance.new("Frame")
Top.Parent = Main
Top.Size = UDim2.new(1, 0, 0, 45)
Top.BackgroundColor3 = Color3.fromRGB(25, 35, 45)
Top.BorderSizePixel = 0
Instance.new("UICorner", Top).CornerRadius = UDim.new(0, 14)

-- Fix corner overlap
local TopFix = Instance.new("Frame", Top)
TopFix.Size = UDim2.new(1, 0, 0.5, 0)
TopFix.Position = UDim2.new(0, 0, 0.5, 0)
TopFix.BackgroundColor3 = Top.BackgroundColor3
TopFix.BorderSizePixel = 0

-- Title Text
local Title = Instance.new("TextLabel")
Title.Parent = Top
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Text = "Next|Hub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(230, 240, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local Close = Instance.new("TextButton")
Close.Parent = Top
Close.Size = UDim2.new(0, 34, 0, 34)
Close.Position = UDim2.new(1, -40, 0, 6)
Close.Text = "✕"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
Close.BorderSizePixel = 0
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 8)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Container
local Container = Instance.new("Frame")
Container.Parent = Main
Container.Position = UDim2.new(0, 0, 0, 50)
Container.Size = UDim2.new(1, 0, 1, -50)
Container.BackgroundTransparency = 1

-- Minimized Logo Button
local MiniLogo = Instance.new("TextButton")
MiniLogo.Parent = ScreenGui
MiniLogo.Size = UDim2.new(0, 55, 0, 55)
MiniLogo.Position = UDim2.new(0.05, 0, 0.5, 0)
MiniLogo.Text = "🎣"
MiniLogo.Font = Enum.Font.GothamBold
MiniLogo.TextSize = 26
MiniLogo.TextColor3 = Color3.fromRGB(255,255,255)
MiniLogo.BackgroundColor3 = Color3.fromRGB(25, 35, 45)
MiniLogo.BorderSizePixel = 0
MiniLogo.Visible = false
MiniLogo.Active = true
MiniLogo.Draggable = true
Instance.new("UICorner", MiniLogo).CornerRadius = UDim.new(1, 0)

-- Template Button Function
local function CreateButton(text, yPos)
    local btn = Instance.new("TextButton")
    btn.Parent = Container
    btn.Size = UDim2.new(0.85, 0, 0, 42)
    btn.Position = UDim2.new(0.075, 0, 0, yPos)
    btn.Text = text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.BackgroundColor3 = Color3.fromRGB(55, 70, 85)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

-- Buttons (Template)
local AutoFish = CreateButton("Auto Fish [OFF]", 0)
local AutoSell = CreateButton("Auto Sell [OFF]", 0.22)
local Teleport = CreateButton("Teleport", 0.44)
local Settings = CreateButton("Settings", 0.66)

-- Placeholder Logic
AutoFish.MouseButton1Click:Connect(function()
    AutoFish.Text = "Auto Fish [ON]"
end)

AutoSell.MouseButton1Click:Connect(function()
    AutoSell.Text = "Auto Sell [ON]"
end)

Teleport.MouseButton1Click:Connect(function()
    print("Teleport clicked")
end)

Settings.MouseButton1Click:Connect(function()
    print("Settings clicked")
end)

-- Notify
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Fish It",
        Text = "GUI Template Loaded",
        Duration = 3
    })
end)
-- Minimize Logic
Minimize.MouseButton1Click:Connect(function()
    Main.Visible = false
    MiniLogo.Visible = true
end)

MiniLogo.MouseButton1Click:Connect(function()
    Main.Visible = true
    MiniLogo.Visible = false
end)
