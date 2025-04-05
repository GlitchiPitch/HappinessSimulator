local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local TycoonService = ReplicatedStorage.Services.Tycoon
local TycoonServiceAssets = TycoonService.Assets
local tycoonServiceEvent = TycoonService.Events.Event
local tycoonServiceEventActions = require(tycoonServiceEvent.Actions)

local TutorialService = ReplicatedStorage.Services.Tutorial
local tutorialServiceEvent = TutorialService.Events.Event
local tutorialServiceEventActions = require(tutorialServiceEvent.Actions)

local PlayerService = script.Parent
local Assets = PlayerService.Assets

local function onCharacterAdded(player: Player,character: Model)
    local playerStats = player:FindFirstChild(Assets.Stats.Name) :: typeof(Assets.Stats)
    local playerTycoon = playerStats.Tycoon.Value :: typeof(TycoonServiceAssets.Tycoon)?
    if playerTycoon then
        character:PivotTo(playerTycoon.Spawner.CFrame)
        -- дефолтный спавн будет на улице
    end
end

local function onPlayerAdded(player: Player)
    local stats = Assets.Stats:Clone()
    stats.Parent = player

    local function _onCharacterAdded(character: Model)
        onCharacterAdded(player, character)
    end
    
    tycoonServiceEvent:Fire(tycoonServiceEventActions.setTycoon, player)
    tutorialServiceEvent:Fire(tutorialServiceEventActions.startTutorial, player)
    player.CharacterAdded:Connect(_onCharacterAdded)
end
local function initialize()
    Players.PlayerAdded:Connect(onPlayerAdded)
end

return { initialize = initialize }