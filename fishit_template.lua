-- Anti double execute
if game.CoreGui:FindFirstChild("NextHubGui") then
    game.CoreGui.NextHubGui:Destroy()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NextHubGui"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 600, 0, 350)
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
main.BackgroundTransparency = 0.1
main.Parent = screenGui
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

-- UI Stroke
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(0, 255, 200)
stroke.Thickness = 1.5

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 160, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

-- GUI Title
local guiTitle = Instance.new("TextLabel")
guiTitle.Size = UDim2.new(1, 0, 0, 40)
guiTitle.Position = UDim2.new(0, 0, 0, 0)
guiTitle.BackgroundTransparency = 1
guiTitle.Text = "Next|Hub"
guiTitle.Font = Enum.Font.GothamBold
guiTitle.TextSize = 20
guiTitle.TextColor3 = Color3.fromRGB(0, 255, 200)
guiTitle.TextXAlignment = Enum.TextXAlignment.Center
guiTitle.Parent = sidebar

-- Sidebar Tabs
local tabs = {"Info","Fishing","Automatically","Trading","Menu","Quest","Teleport"}
for i, name in ipairs(tabs) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 35)
	btn.Position = UDim2.new(0, 5, 0, 45 + ((i-1) * 40))
	btn.BackgroundTransparency = 1
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(200, 200, 200)
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.Parent = sidebar
	
	btn.MouseEnter:Connect(function()
		btn.TextColor3 = Color3.fromRGB(0,255,200)
	end)
	
	btn.MouseLeave:Connect(function()
		btn.TextColor3 = Color3.fromRGB(200,200,200)
	end)
end

-- Content Area
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -170, 1, -20)
content.Position = UDim2.new(0, 170, 0, 10)
content.BackgroundTransparency = 1
content.Parent = main

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Fishing"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = content

-- Toggle Creator
local function createToggle(text, yPos)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 0, 50)
	frame.Position = UDim2.new(0, 0, 0, yPos)
	frame.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
	frame.Parent = content
	
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
	
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.7, 0, 1, 0)
	label.Text = text
	label.Font = Enum.Font.Gotham
	label.TextSize = 14
	label.TextColor3 = Color3.fromRGB(220,220,220)
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = frame
	
	local toggle = Instance.new("TextButton")
	toggle.Size = UDim2.new(0, 50, 0, 25)
	toggle.Position = UDim2.new(1, -60, 0.5, -12)
	toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
	toggle.Text = ""
	toggle.Parent = frame
	
	Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)
	
	local circle = Instance.new("Frame")
	circle.Size = UDim2.new(0, 20, 0, 20)
	circle.Position = UDim2.new(0, 3, 0.5, -10)
	circle.BackgroundColor3 = Color3.fromRGB(200,200,200)
	circle.Parent = toggle
	
	Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
	
	local enabled = false
	
	toggle.MouseButton1Click:Connect(function()
		enabled = not enabled
		
		if enabled then
			toggle.BackgroundColor3 = Color3.fromRGB(0,255,200)
			circle.Position = UDim2.new(1, -23, 0.5, -10)
		else
			toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
			circle.Position = UDim2.new(0, 3, 0.5, -10)
		end
	end)
end

-- Create Toggles
createToggle("Delay Complete (0.01)", 50)
createToggle("Stable Result", 110)
createToggle("Instant Fishing", 170)

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -35, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
minimizeBtn.Text = "—"
minimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Parent = main
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -70, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(170,60,60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BorderSizePixel = 0
closeBtn.Parent = main
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- Floating Logo
local miniLogo = Instance.new("TextButton")
miniLogo.Size = UDim2.new(0, 50, 0, 50)
miniLogo.Position = UDim2.new(0.05, 0, 0.5, 0)
miniLogo.BackgroundColor3 = Color3.fromRGB(25,30,40)
miniLogo.Text = "NX"
miniLogo.TextColor3 = Color3.fromRGB(255,255,255)
miniLogo.Font = Enum.Font.GothamBold
miniLogo.TextSize = 22
miniLogo.Visible = false
miniLogo.Active = true
miniLogo.Draggable = true
miniLogo.Parent = screenGui
Instance.new("UICorner", miniLogo).CornerRadius = UDim.new(1,0)

-- Minimize Logic
minimizeBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	miniLogo.Visible = true
end)

miniLogo.MouseButton1Click:Connect(function()
	main.Visible = true
	miniLogo.Visible = false
end)

-- Close Logic
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
