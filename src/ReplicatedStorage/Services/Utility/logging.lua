local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GlobalConstants = require(ReplicatedStorage.GlobalConstants)

local function log(serviceName: string, message: string)
    if GlobalConstants.GAME_MODE == "_DEV_" then
        warn(`[ {serviceName} ] {message}`)
    end
end

return log