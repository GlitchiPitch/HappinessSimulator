local CollectionService = game:GetService("CollectionService")
local Utility = script.Parent
local TycoonService = Utility.Parent

local Assets = TycoonService.Assets

local Constants = require(TycoonService.Constants)

local function getFreeTycoon() : typeof(Assets.Tycoon)
    local freeTycoon: typeof(Assets.Tycoon)

    for _, tycoon in CollectionService:GetTagged(Constants.TYCOON_TAG) :: { typeof(Assets.Tycoon) } do
        if not tycoon:GetAttribute(Constants.TYCOON_OWNER_ATTRIBUTE) then
            freeTycoon = tycoon
            break
        end
    end

    return freeTycoon
end

return getFreeTycoon