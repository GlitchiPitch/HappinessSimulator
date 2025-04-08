local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerService = ReplicatedStorage.Services.Player
local PlayerServiceAssets = PlayerService.Assets

local TycoonService = script.Parent

local Constants = require(TycoonService.Constants)
local getFreeTycoon = require(TycoonService.Utility.getFreeTycoon)

local event = TycoonService.Events.Event
local eventActions = require(event.Actions)

local function setTycoon(player: Player)
    local freeTycoon = getFreeTycoon()
    local playerStats = player:FindFirstChild(PlayerServiceAssets.Stats.Name) :: typeof(PlayerServiceAssets.Stats)?
    if not freeTycoon then
        player:Kick(string.format(Constants.NO_FREE_TYCOON_MESSAGE, player.Name))
        return
    end

    freeTycoon:SetAttribute(Constants.TYCOON_OWNER_ATTRIBUTE, player.UserId)
    playerStats.Tycoon.Value = freeTycoon
end

local function eventConnect(action: string, ...: any)
    local actions = {
        [eventActions.setTycoon] = setTycoon,
    }
    if actions[action] then
        actions[action](...)
    end
end

local function initialize()
    event.Event:Connect(eventConnect)       
end

return { initialize = initialize }