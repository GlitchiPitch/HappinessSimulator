local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local VERSION = "0.0.0"
local SERVICE_NAME = "Player Service"

local logging = require(ReplicatedStorage.Utility.logging)

logging(SERVICE_NAME, `VERSION : {VERSION}`)

if RunService:IsServer() then
    return require(script.Server)
end
