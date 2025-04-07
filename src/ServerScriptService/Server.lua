local ServerStorage = game:GetService("ServerStorage")

local Services = ServerStorage.Services

local ServerModules = {
    PlayerService = Services.Player,
}

local function initialize()
    for _, module in ServerModules do
        require(module).initialize()
    end
end

initialize()