local RunService = game:GetService("RunService")

if RunService:IsServer() then
    return require(script.Server)
end