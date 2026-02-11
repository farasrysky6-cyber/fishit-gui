--[[
    Fish It - Modern GUI
    Minimize + Close Script
    Ready for loadstring
]]

-- Anti double execute
if game.CoreGui:FindFirstChild("FishItModernGUI") then
    game.CoreGui.FishItModernGUI:Destroy()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FishItModernGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 360, 0, 260)
Main.Position = UDim2.new(0.35, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)

-- Top Bar
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1, 0, 0, 50)
Top.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Top.BorderSizePixel = 0
Instance.new("UICorner", Top).CornerRadius = UDim.new(0, 16)

local Fix = Instance.new("Frame", Top)
Fix.Size = UDim2.new(1, 0, 0.5, 0)
Fix.Position = UDim2.new(0, 0, 0.5, 0)
Fix.BackgroundColor3 = Top.BackgroundColor3
Fix.BorderSizePixel = 0

-- Title
local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1, -120, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🎣 Fish It Hub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(235, 240, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local Minimize = Instance.new("TextButton", Top)
Minimize.Size = UDim2.new(0, 36, 0, 36)
Minimize.Position = UDim2.new(1, -80, 0, 7)
Minimize.Text = "—"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 22
Minimize.TextColor3 = Color3.fromRGB(255,255,255)
Minimize.BackgroundColor3 = Color3.fromRGB(55, 65, 80)
Minimize.BorderSizePixel = 0
Instance.new("UICorner", Minimize).CornerRadius = UDim.new(0, 10)

-- Close Button (Kill Script)
local Close = Instance.new("TextButton", Top)
Close.Size = UDim2.new(0, 36, 0, 36)
Close.Position = UDim2.new(1, -40, 0, 7)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.BackgroundColor3 = Color3.fromRGB(170, 60, 60)
Close.BorderSizePixel = 0
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 10)

-- Content
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 0, 0, 60)
Content.Size = UDim2.new(1, 0, 1, -60)
Content.BackgroundTransparency = 1

-- Button Template
local function CreateButton(text, y)
    local b = Instance.new("TextButton", Content)
    b.Size = UDim2.new(0.85, 0, 0, 44)
    b.Position = UDim2.new(0.075, 0, 0, y)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 16
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.BackgroundColor3 = Color3.fromRGB(45, 55, 70)
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 12)
    return b
end

-- Buttons (Template)
local Btn1 = CreateButton("Auto Fish [SOON]", 0)
local Btn2 = CreateButton("Auto Sell [SOON]", 0.25)
local Btn3 = CreateButton("Teleport [SOON]", 0.5)

-- Floating Logo (Minimized)
local Mini = Instance.new("TextButton")
Mini.Parent = ScreenGui
Mini.Size = UDim2.new(0, 58, 0, 58)
Mini.Position = UDim2.new(0.05, 0, 0.5, 0)
Mini.Text = "🎣"
Mini.Font = Enum.Font.GothamBold
Mini.TextSize = 26
Mini.TextColor3 = Color3.fromRGB(255,255,255)
Mini.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
Mini.BorderSizePixel = 0
Mini.Visible = false
Mini.Active = true
Mini.Draggable = true
Instance.new("UICorner", Mini).CornerRadius = UDim.new(1, 0)

-- Minimize Logic
Minimize.MouseButton1Click:Connect(function()
    Main.Visible = false
    Mini.Visible = true
end)

Mini.MouseButton1Click:Connect(function()
    Main.Visible = true
    Mini.Visible = false
end)

-- Close Script (Destroy All)
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Notify
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Fish It Hub",
        Text = "Modern GUI Loaded",
        Duration = 3
    })
end)
