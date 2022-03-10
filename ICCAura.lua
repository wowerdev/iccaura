local auras = {70856, 70857, 70858, 70859, 70860, 70861, 70781}
local auraNames = {}

for key, value in pairs(auras) do
    auraNames[key] = GetSpellInfo(value)
end

local function cancelAura()
    for key, value in pairs(auraNames) do
        if UnitBuff('player', value) then
            CancelUnitBuff('player', value)
        end
    end
end

function Init()
    CreateFrame("Frame", "ICCAuraFrame")
    ICCAuraFrame.elapsed = 0.2
    ICCAuraFrame:SetScript("OnUpdate", cancelAura)
    print('ICCAura active')
end

function Stop()
    print('ICCAura stop')
    CreateFrame("Frame", "ICCAuraFrame")
    ICCAuraFrame:SetScript("OnUpdate", nil)
end

local function slashHandler(action)
    if action == 'stop' then
        Stop()
    elseif action == 'start' then
        Init()
    else
        print('ICCAura commands: "/ica stop" or "/ica start"')
    end
end

SLASH_ICCAURA1 = "/ica"
SlashCmdList["ICCAURA"] = slashHandler
