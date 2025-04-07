local DataStoreService = game:GetService("DataStoreService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GlobalConstants = require(ReplicatedStorage.GlobalConstants)
local DataTemplate = require(ReplicatedStorage.Services.Data.Template)
local Constants = require(script.Constants)

local MainStore = DataStoreService:GetDataStore("Main" .. GlobalConstants.GAME_MODE .. Constants.VERSION)

local cache = {}

local function get(player: Player)
    local playerData = MainStore:GetAsync(player.UserId) or table.clone(DataTemplate)
    cache[player.UserId] = playerData
end

local function post(player: Player)
    local playerData = cache[player.UserId]
    if Constants.SAVE_DATA then
        MainStore:SetAsync(player.UserId, playerData)
    end

    cache[player.UserId] = nil
end

local function getCache(player: Player) : DataTemplate.DataTemplateType
    local playerData = cache[player.UserId]
    return playerData
end

local function postCache(player: Player, key: string, value: any)
    local playerData = cache[player.UserId]
    if playerData[key] then
        playerData[key] = value
    end
end

return {
    getCache = getCache,
    postCache = postCache,
    post = post,
    get = get,
}