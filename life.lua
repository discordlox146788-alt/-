local P, C, U, R = game:GetService("Players"), game:GetService("CoreGui"), game:GetService("UserInputService"), game:GetService("RunService")
local p = P.LocalPlayer
if C:FindFirstChild("KukirinMenu") then C:FindFirstChild("KukirinMenu"):Destroy() end

local s, w, V, A, g = false, false, 0, 25, nil

local UI = Instance.new("ScreenGui", C) UI.Name = "KukirinMenu"
local ob = Instance.new("Frame", UI) ob.Size, ob.Position, ob.BackgroundColor3, ob.Active = UDim2.new(0, 130, 0, 35), UDim2.new(0.5, -65, 0, 20), Color3.fromRGB(10, 10, 10), true
Instance.new("UICorner", ob).CornerRadius = UDim.new(0, 8)
local obs = Instance.new("UIStroke", ob) obs.Color, obs.Thickness = Color3.fromRGB(255, 255, 255), 1.5

local obl = Instance.new("TextButton", ob) obl.Size, obl.BackgroundTransparency, obl.Text, obl.TextColor3, obl.Font, obl.TextSize = UDim2.new(1, 0, 1, 0), 1, "OPEN MENU", Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 11

local f = Instance.new("Frame", UI) f.Size, f.Position, f.BackgroundColor3, f.Active = UDim2.new(0, 240, 0, 230), UDim2.new(0.5, -120, 0, 70), Color3.fromRGB(15, 15, 15), true
Instance.new("UICorner", f).CornerRadius = UDim.new(0, 12)
local st = Instance.new("UIStroke", f) st.Color, st.Thickness = Color3.fromRGB(255, 255, 255), 1.5

local tl = Instance.new("TextLabel", f) tl.Size, tl.BackgroundTransparency, tl.Text, tl.Font, tl.TextSize = UDim2.new(1, 0, 0, 40), 1, "KUKIRIN LIFE SCRIPT", Enum.Font.GothamBold, 13

task.spawn(function() local h = 0 while task.wait(0.01) do h = (h + 1) % 360 tl.TextColor3 = Color3.fromHSV(h/360, 0.8, 1) end end)

local function drag(btn, fr)
    local dg, st, sp
    btn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dg, st, sp = true, i.Position, fr.Position end end)
    U.InputChanged:Connect(function(i) if (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) and dg then local dt = i.Position - st fr.Position = UDim2.new(sp.X.Scale, sp.X.Offset + dt.X, sp.Y.Scale, sp.Y.Offset + dt.Y) end end)
    btn.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dg = false end end)
end
drag(obl, ob)

local function sb(b, tx, ac)
    b.Font, b.TextSize, b.Text = Enum.Font.GothamBold, 12, tx
    b.TextColor3 = ac and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    b.BackgroundColor3 = ac and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    local sbt = Instance.new("UIStroke", b) sbt.Color, sbt.Thickness = Color3.fromRGB(255, 255, 255), 1
end

local b1, b2 = Instance.new("TextButton", f), Instance.new("TextButton", f)
b1.Size, b1.Position = UDim2.new(0, 200, 0, 32), UDim2.new(0.5, -100, 0, 45) sb(b1, "Авто-кручение [T]", true)
b2.Size, b2.Position = UDim2.new(0, 200, 0, 32), UDim2.new(0.5, -100, 0, 85) sb(b2, "Авто-Вилли [G]", true)

local sl = Instance.new("TextLabel", f) sl.Size, sl.Position, sl.BackgroundTransparency, sl.Text, sl.TextColor3, sl.Font, sl.TextSize = UDim2.new(1, 0, 0, 25), UDim2.new(0, 0, 0, 130), 1, "Доп. Скорость: 0", Color3.fromRGB(255, 255, 255), Enum.Font.GothamMedium, 12
local bm, bp = Instance.new("TextButton", f), Instance.new("TextButton", f)
bm.Size, bm.Position = UDim2.new(0, 65, 0, 28), UDim2.new(0.15, 0, 0, 165) sb(bm, "-", false)
bp.Size, bp.Position = UDim2.new(0, 65, 0, 28), UDim2.new(0.60, 0, 0, 165) sb(bp, "+", false)

obl.MouseButton1Click:Connect(function() f.Visible = not f.Visible end)
bp.MouseButton1Click:Connect(function() V = math.clamp(V + 10, 0, 150) sl.Text = "Доп. Скорость: " .. V end)
bm.MouseButton1Click:Connect(function() V = math.clamp(V - 10, 0, 150) sl.Text = "Доп. Скорость: " .. V end)

local function ts()
    s = not s
    if s then if w then tw() end b1.Text, b1.BackgroundColor3, b1.TextColor3 = "СТОП КРУЧЕНИЕ", Color3.fromRGB(0, 0, 0), Color3.fromRGB(255, 255, 255)
        task.spawn(function() while s do
            local ch, hu = p.Character, p.Character and p.Character:FindFirstChildOfClass("Humanoid")
            if hu and hu.SeatPart then
                local bk, sc = hu.SeatPart, hu.SeatPart.CFrame
                hu.Sit, bk.AssemblyLinearVelocity, bk.AssemblyAngularVelocity = true, Vector3.zero, Vector3.zero
                local bv = Instance.new("BodyVelocity", bk) bv.Velocity, bv.MaxForce = Vector3.new(0, 65, 0), Vector3.new(math.huge, math.huge, math.huge) task.wait(0.14) bv:Destroy()
                local bg = Instance.new("BodyGyro", bk) bg.MaxTorque, bg.P, bg.D = Vector3.new(math.huge, math.huge, math.huge), 40000, 600
                local st = tick() while tick() - st < 1.9 and s do
                    if hu.SeatPart ~= bk then hu.Sit = true end
                    bg.CFrame = CFrame.new(sc.Position.X, bk.Position.Y, sc.Position.Z) * CFrame.Angles(0, select(2, sc.Rotation:ToEulerAnglesYXZ()) + math.rad(3240 * math.min((tick() - st) / 1.9, 1)), 0)
                    task.wait()
                end
                if s then bg.CFrame = CFrame.new(sc.Position.X, bk.Position.Y, sc.Position.Z) * CFrame.Angles(0, select(2, sc.Rotation:ToEulerAnglesYXZ()), 0) task.wait(0.1) bg:Destroy() repeat task.wait() until math.abs(bk.AssemblyLinearVelocity.Y) < 0.4 or not s task.wait(0.4) else bg:Destroy() end
            end
            task.wait(0.1)
        end end)
    else b1.Text, b1.BackgroundColor3, b1.TextColor3 = "Авто-кручение [T]", Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0) end
end

function tw()
    w = not w
    if w then if s then ts() end b2.Text, b2.BackgroundColor3, b2.TextColor3 = "СТОП ВИЛЛИ", Color3.fromRGB(0, 0, 0), Color3.fromRGB(255, 255, 255)
    else b2.Text, b2.BackgroundColor3, b2.TextColor3 = "Авто-Вилли [G]", Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0) if g then g:Destroy() g = nil end end
end

b1.MouseButton1Click:Connect(ts) b2.MouseButton1Click:Connect(tw)
U.InputBegan:Connect(function(i, gpe) if not gpe then if i.KeyCode == Enum.KeyCode.T then ts() elseif i.KeyCode == Enum.KeyCode.G then tw() end end end)

R.Stepped:Connect(function()
    local hu = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
    if hu then
        hu:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false) hu:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        local bk = hu.SeatPart
        if bk and bk:IsA("VehicleSeat") and not s then
            if V > 0 and (U:IsKeyDown(Enum.KeyCode.W) or w) then
                bk.AssemblyLinearVelocity = bk.AssemblyLinearVelocity + (Vector3.new(bk.CFrame.LookVector.X, 0, bk.CFrame.LookVector.Z).Unit * (V * 0.015))
            end
            if w then
                if not g or g.Parent ~= bk then if g then g:Destroy() end g = Instance.new("BodyGyro") g.P, g.D, g.MaxTorque, g.Parent = 15000, 400, Vector3.new(math.huge, 0, 0), bk end
                g.CFrame = CFrame.Angles(0, select(2, bk.CFrame:ToEulerAnglesYXZ()), 0) * CFrame.Angles(math.rad(A), 0, 0)
            elseif g then g:Destroy() g = nil end
        else if g then g:Destroy() g = nil end end
    end
end)
