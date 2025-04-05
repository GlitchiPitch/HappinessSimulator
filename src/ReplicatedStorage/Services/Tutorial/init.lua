local RunService = game:GetService("RunService")
local VERSION = "0.0.0"
local SERVICE_NAME = "Tutorial Service"



if RunService:IsServer() then
    return require(script.Server)    
end