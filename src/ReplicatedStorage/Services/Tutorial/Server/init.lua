local TutorialService = script.Parent
local tutorialServiceEvent = TutorialService.Events.Event
local tutorialServiceEventActions = require(tutorialServiceEvent.Actions)

local function startTutorial(player: Player)
    
end

local function tutorialServiceEventConnect(action: string, ...: any)
    local actions = {
        [tutorialServiceEventActions.startTutorial] = startTutorial,
    }
    
    if actions[action] then
        actions[action](...)
    end

end

local function initialize()
    tutorialServiceEvent.Event:Connect(tutorialServiceEventConnect)
end

return { initialize = initialize }