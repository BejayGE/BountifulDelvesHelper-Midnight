BountifulDelvesHunter = BountifulDelvesHunter or {}

version = C_AddOns.GetAddOnMetadata("BountifulDelvesHunter-Midnight", "Version") or "1.0.0"
locale = "enUS"

if not BountifulDelvesHunterDB then
    BountifulDelvesHunterDB = {
        highestDelveTier = nil,
        waypointSystem = "default",
		TWW = false,
		locale = "enUS",
		reminder_restoration = true
    }
end

if not BountifulDelvesHunterIconDB then
    BountifulDelvesHunterIconDB = {
        minimapPos = 140,
        hide = false,
    }
end

SLASH_BDH1 = "/BDH"
SLASH_BDH2 = "/bdh"

legendRelics = C_QuestLine.GetQuestLineQuests(6015) 
saltherilsHaven = {90573,90574,90575,90576}
preyQuests = C_QuestLine.GetQuestLineQuests(5945)

local cofferShardCurrencyID = 3310
local sortBy = "zone"  
local sortDescending = false 
local TROVEHUNTER_BOUNTY_ITEMID = 265714
local toastFrame
-- local usedThisWeek = C_QuestLog.IsQuestFlaggedCompleted(92887)

	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	frame:RegisterEvent("UPDATE_UI_WIDGET")
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame:RegisterEvent("DISPLAY_EVENT_TOAST_LINK")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	
	local popupShown = false
	local pendingPopup = false
	local hasActivatedStone = false
	
AceGUI = LibStub("AceGUI-3.0")
isFrameVisible = false
BountifulDelvesHunterMainFrame = {}

function showUI()
    Delves = {}
	AllDelves = {}
	LegacyDelves = {}
	AllLegacyDelves = {}
	locale = BountifulDelvesHunterDB.locale or "enUS"
		
	TWW = false
	
    if not C_AddOns.IsAddOnLoaded("Blizzard_DelvesCompanionConfiguration") then
        C_AddOns.LoadAddOn("Blizzard_DelvesCompanionConfiguration")
    end

    for delvePoiID, delveConfig in pairs(waypoints) do
        local delve = C_AreaPoiInfo.GetAreaPOIInfo(delveConfig["zone"], delvePoiID)
		if delve == nil then
			delve = C_AreaPoiInfo.GetAreaPOIInfo(delveConfig["zone"], tonumber(delvePoiID) - 1)
		end
		local storyVariant = GetStory(delve)
		local areaName = areaIDs[delveConfig["zone"]]
        if delve ~= nil and delve["atlasName"] == "delves-bountiful" then
		

            local icon = C_UIWidgetManager.GetAllWidgetsBySetID(delve.iconWidgetSet)
            local isOvercharged = false
			local dName = tostring(delvePoiID)
			--local dName = delve["name"]:gsub("^%s+", ""):gsub("%s+$", "")
			
			local story_short = CleanStoryText(storyVariant)
			--print(story_short)
			--print (dName)
			local tier = "?-Tier"
			if dName ~= nil and story_short ~= nil then
				tier = DelveStoryTiers[dName][story_short]
			end

            if #icon == 2 then
                isOvercharged = true
            end
	    if delveConfig["zone"] > 2392 then
            Delves[delvePoiID] = { ["name"] = delve["name"], ["zone"] = areaName, ["overcharged"] = isOvercharged, ["story"] = storyVariant, ["tier"] = tier }
	    else 
			LegacyDelves[delvePoiID] = { ["name"] = delve["name"], ["zone"] = areaName, ["overcharged"] = isOvercharged, ["story"] = storyVariant, ["tier"] = tier }
	    end
        end
		if delve ~= nil then
			if delveConfig["zone"] > 2392 then
				AllDelves[delvePoiID] = { ["name"] = delve["name"], ["zone"] = areaName, ["overcharged"] = isOvercharged, ["TWW"] = false }
			else
				AllLegacyDelves[delvePoiID] = { ["name"] = delve["name"], ["zone"] = areaName, ["overcharged"] = isOvercharged, ["TWW"] = true }
			end	
		end
    end

    local function DrawDelvesGroup(container)
        local count = 0
        for _ in pairs(Delves) do
            count = count + 1
        end
		
		 guiCreateNewline(container, 2)

            cofferKeys = C_CurrencyInfo.GetCurrencyInfo(3028)
            cofferKeyIcon = GetItemIcon(224172)

            if cofferKeys.quantity == 0 then
                textColor = "\124cffE02E2E"
            else
                textColor = "\124cff2FE02F"
            end

            if cofferKeys.quantity == 1 then
                cofferKeyCountLabel = LanguageBase[locale]["KeyOnChar"]
            else
                cofferKeyCountLabel = LanguageBase[locale]["KeysOnChar"]
            end

            local text = AceGUI:Create("InteractiveLabel")
            text:SetImage(cofferKeyIcon)
            text:SetImageSize(22, 22)
            text:SetText(textColor .. cofferKeys.quantity .. "\124cffFFFFFF " .. cofferKeyCountLabel )
            text:SetWidth(420)
            text:SetFont(GameFontHighlightLarge:GetFont())
            container:AddChild(text)

            guiCreateSpacing(container, 5)

	    cofferShards = C_CurrencyInfo.GetCurrencyInfo(3310)
	    weeklyShardsMax = cofferShards.maxWeeklyQuantity
	    weeklyShardsObtained = cofferShards.quantityEarnedThisWeek
	    weeklyShardsBalance = weeklyShardsMax-weeklyShardsObtained

            WeeklyShardsIcon = GetItemIcon(236096) 

            if weeklyShardsBalance == 0 then
                textColor = "\124cffE02E2E"
            else
                textColor = "\124cff2FE02F"
            end

            if weeklyShardsBalance == 1 then
                cofferShardCountLabel = LanguageBase[locale]["shard"]
            else
                cofferShardCountLabel = LanguageBase[locale]["shards"]
            end

            local text = AceGUI:Create("InteractiveLabel")
            text:SetImage(WeeklyShardsIcon)
            text:SetImageSize(22, 22)
            text:SetText(textColor .. weeklyShardsBalance .. "\124cffFFFFFF " .. cofferShardCountLabel .. weeklyShardsMax ..LanguageBase[locale]["shardWeek"])
            text:SetWidth(420)
            text:SetFont(GameFontHighlightLarge:GetFont())
            container:AddChild(text)

            guiCreateSpacing(container, 5)

            cofferKeyShardsCount = C_CurrencyInfo.GetCurrencyInfo(3310)

	  if cofferKeyShardsCount.quantity < 100 then
                keysToCreateCount = 0
            else
                keysToCreateCount = math.floor(cofferKeyShardsCount.quantity / 100)
            end
	CofferKeyShardIcon = GetItemIcon(236096)

            if cofferKeyShardsCount.quantity < 100 then
                textColor = "\124cffE02E2E"
            else
                textColor = "\124cff2FE02F"
            end

	if keysToCreateCount == 1 then
                cofferKeyCountLabel = LanguageBase[locale]["KeyOnChar2"]
            else
                cofferKeyCountLabel = LanguageBase[locale]["KeysOnChar2"]
            end
	local text = AceGUI:Create("InteractiveLabel")
            text:SetImage(CofferKeyShardIcon)
            text:SetImageSize(22, 22)
	    text:SetText(textColor .. keysToCreateCount .. "\124cffFFFFFF " .. cofferKeyCountLabel .. cofferKeyShardsCount.quantity .. LanguageBase[locale]["shards2"])
            text:SetWidth(420)
            text:SetFont(GameFontHighlightLarge:GetFont())
	    container:AddChild(text)
		
		guiCreateNewline(container, 3)

		JourneyIcon = 6025441
		
		local progress = C_MajorFactions.GetMajorFactionRenownInfo(C_DelvesUI.GetDelvesFactionForSeason())
		local current = progress.renownReputationEarned
		local maxP = progress.renownLevelThreshold
			local prog = AceGUI:Create("InteractiveLabel")
            prog:SetImage(JourneyIcon)
            prog:SetImageSize(22, 22)
			prog:SetText((LanguageBase[locale]["Journey"]:format(progress.renownLevel, current, maxP)))
            prog:SetWidth(420)
            prog:SetFont(GameFontHighlightLarge:GetFont())
			container:AddChild(prog)
		
            guiCreateNewline(container, 3)

            local button = AceGUI:Create("Button")
            button:SetText(LanguageBase[locale]["GV"])
            button:SetWidth(100)
            button:SetCallback("OnClick", function()
                C_AddOns.LoadAddOn("Blizzard_WeeklyRewards")
                BountifulDelvesHunterMainFrame:Hide()
                WeeklyRewardsFrame:Show()
            end)
            container:AddChild(button)

            local lfgbutton1 = AceGUI:Create("Button")
            lfgbutton1:SetText(LanguageBase[locale]["SLFG"])
            lfgbutton1:SetWidth(100)
--			BDH_VoidStyleButton(lfgbutton1)
			lfgbutton1:SetCallback("OnClick", function()
			openStartGroupFrame("delves")
			BountifulDelvesHunterMainFrame:Hide()
			end)
            container:AddChild(lfgbutton1)

            if IsInRaid() then
                lfgbutton1:SetDisabled(true)
            elseif IsInGroup() and not UnitIsGroupLeader("player") then
                lfgbutton1:SetDisabled(true)
            else
                lfgbutton1:SetDisabled(false)
            end

            local lfgbutton2 = AceGUI:Create("Button")
            lfgbutton2:SetText(LanguageBase[locale]["FLFG"])
			lfgbutton2:SetWidth(100)
            lfgbutton2:SetCallback("OnClick", function()
                openFindGroupFrame("delves")
                BountifulDelvesHunterMainFrame:Hide()
            end)
            container:AddChild(lfgbutton2)
			
			local companionbtn = AceGUI:Create("Button")
            companionbtn:SetText("Valeera")
			companionbtn:SetWidth(100)
            companionbtn:SetCallback("OnClick", function()			
                BountifulDelvesHunterMainFrame:Hide()
				ToggleFrame(DelvesCompanionConfigurationFrame)
            end)
			if DelvesCompanionConfigurationFrame then
            container:AddChild(companionbtn)
			end

		
        if count == 0 then
            guiCreateNewline(container, 3)

            if UnitLevel("player") < 68 then
                local label = AceGUI:Create("Label")
                label:SetText(getColorText("FF7E40", LanguageBase[locale]["unlock"]))
                label:SetFont(GameFontHighlightLarge:GetFont())
                label:SetFullWidth(true)
                container:AddChild(label)
            else
                local label = AceGUI:Create("Label")
                label:SetText(getColorText("FF7E40", LanguageBase[locale]["noDelve"]))
                label:SetFont(GameFontHighlightLarge:GetFont())
                label:SetFullWidth(true)
                container:AddChild(label)
            end

        else
           
            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            guiCreateNewline(container, 1)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetText(LanguageBase[locale]["dName"])
			BDH_VoidStyleLabel(label, "dim")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(220)
            container:AddChild(label)

			local label = AceGUI:Create("Label")
            label:SetText("Tier*")
			BDH_VoidStyleLabel(label, "dim")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(60)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetText(LanguageBase[locale]["Zone"])
			BDH_VoidStyleLabel(label, "dim")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(100)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(150)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            for mapPoiID, delve in pairs(Delves) do
                local label = AceGUI:Create("Label")
                label:SetImageSize(18, 18)
                local name = ""

                if delve["overcharged"] == true then
                    name = "(OC) " .. "\124cffFF9C00" .. delve["name"] .. "\124r"
                else
                    name = "\124cffA335EE" .. delve["name"] .. "\124r"
                end

                label:SetText(name)
                label:SetFont(GameFontHighlightMedium:GetFont())
                label:SetWidth(220)
                container:AddChild(label)

				local label = AceGUI:Create("Label")
                label:SetText(delve["tier"])
                label:SetFont(GameFontHighlightMedium:GetFont())
                label:SetWidth(60)
                container:AddChild(label)



                local label = AceGUI:Create("Label")
                label:SetText(delve["zone"])
                label:SetFont(GameFontHighlightMedium:GetFont())
                label:SetWidth(100)
                container:AddChild(label)
				


                local button = AceGUI:Create("Button")
                button:SetText(LanguageBase[locale]["Wp"])
                button:SetWidth(120)
                button:SetCallback("OnClick", function()
                    setWaypoint("default", mapPoiID, delve["name"])
                end)
                container:AddChild(button)

                local button = AceGUI:Create("Button")
                button:SetText("TomTom")
                button:SetWidth(120)
                button:SetCallback("OnClick", function()
                    setWaypoint("tomtom", mapPoiID, delve["name"])
                end)
                container:AddChild(button)

                if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    button:SetDisabled(true)
                end
								
				local storyLbl = AceGUI:Create("Label")
				storyLbl:SetText(delve["story"])
				storyLbl:SetHeight(5)
				BDH_VoidStyleLabel(storyLbl, "dim")
                storyLbl:SetFont(GameFontHighlightSmall:GetFont())
                storyLbl:SetFullWidth(true)
			   container:AddChild(storyLbl)
				
            end
        end
		guiCreateNewline(container, 5)
		
		local TWWHeader = AceGUI:Create("Label")
        TWWHeader:SetText("The War Within Active Bountiful Delves ")
		BDH_VoidStyleLabel(TWWHeader, "dim")
		TWWHeader:SetFont(GameFontHighlightLarge:GetFont())
        TWWHeader:SetWidth(500)
        if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
			container:AddChild(TWWHeader)
		else
			AceGUI:Release(TWWHeader)     
			TWWHeader = nil
		end
		
	        local Linfo = AceGUI:Create("Label")
            Linfo:SetFullWidth(true)
			BDH_VoidStyleLabel(Linfo, "secondary")
			Linfo:SetText("Please remember that these do not grant loot on current level")
			Linfo:SetFont(GameFontHighlightMedium:GetFont())
            if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
			container:AddChild(Linfo)
			else
			AceGUI:Release(Linfo)     
			Linfo = nil
			end

            guiCreateNewline(container, 2)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            local DName = AceGUI:Create("Label")
            DName:SetText("Delve Name")
			BDH_VoidStyleLabel(DName, "dim")
            DName:SetFont(GameFontHighlightSmall:GetFont())
            DName:SetWidth(220)
			if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
			container:AddChild(DName)
			else
			AceGUI:Release(DName)     
			DName = nil
			end
           
            local DZone = AceGUI:Create("Label")
            DZone:SetText("Zone")
			BDH_VoidStyleLabel(DZone, "dim")
            DZone:SetFont(GameFontHighlightSmall:GetFont())
            DZone:SetWidth(120)
            if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
			container:AddChild(DZone)
			else
			AceGUI:Release(DZone)     
			DName = nil
			end

            local label = AceGUI:Create("Label")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(150)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            for mapPoiID, delve in pairs(LegacyDelves) do
                local LDelves = AceGUI:Create("Label")
                LDelves:SetImageSize(18, 18)
                local name = ""

                if delve["overcharged"] == true then
                    name = "(OC) " .. "\124cffFF9C00" .. delve["name"] .. "\124r"
                else
                    name = "\124cffA335EE" .. delve["name"] .. "\124r"
                end

                LDelves:SetText(name)
                LDelves:SetFont(GameFontHighlightMedium:GetFont())
                LDelves:SetWidth(220)
               	if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
				container:AddChild(LDelves)
				else
				AceGUI:Release(LDelves)     
				LDelves = nil
				end

                local DelveZone = AceGUI:Create("Label")
                DelveZone:SetText(delve["zone"])
                DelveZone:SetFont(GameFontHighlightMedium:GetFont())
                DelveZone:SetWidth(120)
				if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
				container:AddChild(DelveZone)
				else
				AceGUI:Release(DelveZone)     
				DelveZone = nil
				end

                local WPbutton = AceGUI:Create("Button")
                WPbutton:SetText("Waypoint")
                WPbutton:SetWidth(120)
                WPbutton:SetCallback("OnClick", function()
                    setWaypoint("default", mapPoiID, delve["name"])
                end)
                if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
				container:AddChild(WPbutton)
				else
				AceGUI:Release(WPbutton)     
				WPbutton = nil
				end

                local TTbutton = AceGUI:Create("Button")
                TTbutton:SetText("TomTom")
                TTbutton:SetWidth(120)
                TTbutton:SetCallback("OnClick", function()
                    setWaypoint("tomtom", mapPoiID, delve["name"])
                end)
                if BountifulDelvesHunterDB.TWW == true and next(LegacyDelves) ~= nil then 
				container:AddChild(TTbutton)
				if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    TTbutton:SetDisabled(true)
                end
				else
				AceGUI:Release(TTbutton)     
				TTbutton = nil
				end

				local storyLbl = AceGUI:Create("Label")
				storyLbl:SetText(delve["story"])
				storyLbl:SetHeight(5)
				BDH_VoidStyleLabel(storyLbl, "dim")
                storyLbl:SetFont(GameFontHighlightSmall:GetFont())
                storyLbl:SetFullWidth(true)
				if BountifulDelvesHunterDB.TWW == true then 
			    container:AddChild(storyLbl)
				end
            end		
    end

 local function DrawAllDelvesGroup(container)
        local count = 0
        for _ in pairs(AllDelves) do
            count = count + 1
        end
		
		 guiCreateNewline(container, 2)

        if count == 0 then
            guiCreateNewline(container, 3)

            if UnitLevel("player") < 68 then
                local label = AceGUI:Create("Label")
                label:SetText(getColorText("FF7E40", LanguageBase[locale]["unlock"]))
                label:SetFont(GameFontHighlightLarge:GetFont())
                label:SetFullWidth(true)
                container:AddChild(label)
            else
                local label = AceGUI:Create("Label")
                label:SetText(getColorText("FF7E40", LanguageBase[locale]["noDelve"]))
                label:SetFont(GameFontHighlightLarge:GetFont())
                label:SetFullWidth(true)
                container:AddChild(label)
            end

        else
           
            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            guiCreateNewline(container, 1)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetText(LanguageBase[locale]["dName"])
			BDH_VoidStyleLabel(label, "dim")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(220)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetText(LanguageBase[locale]["Zone"])
			BDH_VoidStyleLabel(label, "dim")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(120)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(150)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            for mapPoiID, delve in pairs(AllDelves) do
                local label = AceGUI:Create("Label")
                --label:SetImageSize(18, 18)
                local name = ""

                if delve["overcharged"] == true then
                    name = "(OC) " .. "\124cffFF9C00" .. delve["name"] .. "\124r"
                else
                    name = "\124cffA335EE" .. delve["name"]  .. "\124r"
                end

                label:SetText(name)
                label:SetFont(GameFontHighlightMedium:GetFont())
                label:SetWidth(220)
				container:AddChild(label)
	
                local label = AceGUI:Create("Label")
                label:SetText(delve["zone"])
                label:SetFont(GameFontHighlightMedium:GetFont())
                label:SetWidth(120)
                container:AddChild(label)

                local button = AceGUI:Create("Button")
                button:SetText(LanguageBase[locale]["Wp"])
                button:SetWidth(120) 
                button:SetCallback("OnClick", function()
                    setWaypointAll("default", mapPoiID, delve["name"])
                end)
                container:AddChild(button)

                local button = AceGUI:Create("Button")
                button:SetText("TomTom")
                button:SetWidth(120)
                button:SetCallback("OnClick", function()
                    setWaypointAll("tomtom", mapPoiID, delve["name"])
                end)
                container:AddChild(button)

                if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    button:SetDisabled(true)
                end
								
				--local storyLbl = AceGUI:Create("Label")
				--storyLbl:SetText(delve["story"])
				--storyLbl:SetHeight(5)
				--BDH_VoidStyleLabel(storyLbl, "dim")
                --storyLbl:SetFont(GameFontHighlightSmall:GetFont())
                --storyLbl:SetFullWidth(true)
			   --container:AddChild(storyLbl)
				
            end
        end
		guiCreateNewline(container, 5)
		
		local TWWHeader = AceGUI:Create("Label")
        TWWHeader:SetText("The War Within Delves ")
		BDH_VoidStyleLabel(TWWHeader, "dim")
		TWWHeader:SetFont(GameFontHighlightLarge:GetFont())
        TWWHeader:SetWidth(500)
        if BountifulDelvesHunterDB.TWW == true then 
			container:AddChild(TWWHeader)
		else
			AceGUI:Release(TWWHeader)     
			TWWHeader = nil
		end
		
	        local Linfo = AceGUI:Create("Label")
            Linfo:SetFullWidth(true)
			BDH_VoidStyleLabel(Linfo, "secondary")
			Linfo:SetText("Please remember that these do not grant loot on current level")
			Linfo:SetFont(GameFontHighlightMedium:GetFont())
            if BountifulDelvesHunterDB.TWW == true then 
			container:AddChild(Linfo)
			else
			AceGUI:Release(Linfo)     
			Linfo = nil
			end

            guiCreateNewline(container, 2)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            local DName = AceGUI:Create("Label")
            DName:SetText("Delve Name")
			BDH_VoidStyleLabel(DName, "dim")
            DName:SetFont(GameFontHighlightSmall:GetFont())
            DName:SetWidth(220)
			if BountifulDelvesHunterDB.TWW == true then 
			container:AddChild(DName)
			else
			AceGUI:Release(DName)     
			DName = nil
			end
           
            local DZone = AceGUI:Create("Label")
            DZone:SetText("Zone")
			BDH_VoidStyleLabel(DZone, "dim")
            DZone:SetFont(GameFontHighlightSmall:GetFont())
            DZone:SetWidth(120)
            if BountifulDelvesHunterDB.TWW == true then 
			container:AddChild(DZone)
			else
			AceGUI:Release(DZone)     
			DName = nil
			end

            local label = AceGUI:Create("Label")
            label:SetFont(GameFontHighlightSmall:GetFont())
            label:SetWidth(150)
            container:AddChild(label)

            local label = AceGUI:Create("Label")
            label:SetFullWidth(true)
            container:AddChild(label)

            for mapPoiID, delve in pairs(AllLegacyDelves) do
                local LDelves = AceGUI:Create("Label")
                LDelves:SetImageSize(18, 18)
                local name = ""

                if delve["overcharged"] == true then
                    name = "(OC) " .. "\124cffFF9C00" .. delve["name"] .. "\124r"
                else
                    name = "\124cffA335EE" .. delve["name"] .. "\124r"
                end

                LDelves:SetText(name)
                LDelves:SetFont(GameFontHighlightMedium:GetFont())
                LDelves:SetWidth(220)
               	if BountifulDelvesHunterDB.TWW == true then 
				container:AddChild(LDelves)
				else
				AceGUI:Release(LDelves)     
				LDelves = nil
				end

                local DelveZone = AceGUI:Create("Label")
                DelveZone:SetText(delve["zone"])
                DelveZone:SetFont(GameFontHighlightMedium:GetFont())
                DelveZone:SetWidth(120)
				if BountifulDelvesHunterDB.TWW == true then 
				container:AddChild(DelveZone)
				else
				AceGUI:Release(DelveZone)     
				DelveZone = nil
				end

                local WPbutton = AceGUI:Create("Button")
                WPbutton:SetText("Waypoint")
                WPbutton:SetWidth(120)
                WPbutton:SetCallback("OnClick", function()
                    setWaypointAll("default", mapPoiID, delve["name"])
                end)
                if BountifulDelvesHunterDB.TWW == true then 
				container:AddChild(WPbutton)
				else
				AceGUI:Release(WPbutton)     
				WPbutton = nil
				end

                local TTbutton = AceGUI:Create("Button")
                TTbutton:SetText("TomTom")
                TTbutton:SetWidth(120)
                TTbutton:SetCallback("OnClick", function()
                    setWaypointAll("tomtom", mapPoiID, delve["name"])
                end)
                if BountifulDelvesHunterDB.TWW == true then 
				container:AddChild(TTbutton)
				if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    TTbutton:SetDisabled(true)
                end
				else
				AceGUI:Release(TTbutton)     
				TTbutton = nil
				end

				local storyLbl = AceGUI:Create("Label")
				storyLbl:SetText(delve["story"])
				storyLbl:SetHeight(5)
				BDH_VoidStyleLabel(storyLbl, "dim")
                storyLbl:SetFont(GameFontHighlightSmall:GetFont())
                storyLbl:SetFullWidth(true)
				if BountifulDelvesHunterDB.TWW == true then 
			    container:AddChild(storyLbl)
				end
            end		
    end



	local function DrawCofferShardsWQGroup(container)
    container:ReleaseChildren()

    -- Title
    local title = AceGUI:Create("Label")
    title:SetText(LanguageBase[locale]["WQTitle"])
    title:SetFont(GameFontHighlightLarge:GetFont())
    title:SetFullWidth(true)
    container:AddChild(title)

    guiCreateNewline(container, 2)

    -- Info
    local info = AceGUI:Create("Label")
    info:SetText(LanguageBase[locale]["WQSubTitle"])
    info:SetFullWidth(true)
    container:AddChild(info)

    guiCreateNewline(container, 2)
    guiCreateSpacing(container, 10)

    -- Buttons: Refresh + Sort
    local refreshBtn = AceGUI:Create("Button")
    refreshBtn:SetText(LanguageBase[locale]["RFresh"])
    refreshBtn:SetWidth(120)
    refreshBtn:SetCallback("OnClick", function()
        container:ReleaseChildren()
        DrawCofferShardsWQGroup(container)
        container:DoLayout()
    end)
    container:AddChild(refreshBtn)

    local sortZoneBtn = AceGUI:Create("Button")
    sortZoneBtn:SetText(sortBy == "zone" and (sortDescending and "Zone ↑" or "Zone ↓") or "Zone")
    sortZoneBtn:SetWidth(85)
    sortZoneBtn:SetCallback("OnClick", function()
        if sortBy == "zone" then
            sortDescending = not sortDescending
        else
            sortBy = "zone"
            sortDescending = false
        end
        container:ReleaseChildren()
        DrawCofferShardsWQGroup(container)
        container:DoLayout()
    end)
    container:AddChild(sortZoneBtn)

    local sortNameBtn = AceGUI:Create("Button")
    sortNameBtn:SetText(sortBy == "name" and (sortDescending and "Name ↑" or "Name ↓") or "Name")
    sortNameBtn:SetWidth(100)
	
    sortNameBtn:SetCallback("OnClick", function()
        if sortBy == "name" then
            sortDescending = not sortDescending
        else
            sortBy = "name"
            sortDescending = false
        end
        container:ReleaseChildren()
        DrawCofferShardsWQGroup(container)
        container:DoLayout()
    end)
    container:AddChild(sortNameBtn)

    guiCreateNewline(container, 2)

    -- Load WQs & Sort
    local wqs = GetCofferShardsWorldQuests()
    table.sort(wqs.worldQuests, function(a, b)
        local aVal, bVal
        if sortBy == "name" then
            aVal, bVal = a.title, b.title
        else
            aVal, bVal = a.zone, b.zone
        end
        if aVal == bVal then
            return a.title < b.title 
        end
        if sortDescending then
            return aVal > bVal
        end
        return aVal < bVal
    end)

    if #wqs.worldQuests == 0 then
        local none = AceGUI:Create("Label")
        none:SetText(LanguageBase[locale]["NoWQ"])
        none:SetFullWidth(true)
        container:AddChild(none)
    else
        -- Header
        local headerZone = AceGUI:Create("Label")
        headerZone:SetText(LanguageBase[locale]["Zone"])
		BDH_VoidStyleLabel(headerZone, "dim")
		headerZone:SetFont(GameFontHighlightMedium:GetFont())
        headerZone:SetWidth(150)
        container:AddChild(headerZone)

        local headerName = AceGUI:Create("Label")
        headerName:SetText(LanguageBase[locale]["QName"])
		BDH_VoidStyleLabel(headerName, "dim")
		headerName:SetFont(GameFontHighlightMedium:GetFont())
        headerName:SetWidth(200)
        container:AddChild(headerName)

        local headerAmount = AceGUI:Create("Label")
        headerAmount:SetText(LanguageBase[locale]["Shards"])
		BDH_VoidStyleLabel(headerAmount, "dim")
		headerAmount:SetFont(GameFontHighlightMedium:GetFont())
        headerAmount:SetWidth(80)
        container:AddChild(headerAmount)

        local headerWP = AceGUI:Create("Label")
        headerWP:SetText(LanguageBase[locale]["Wp"])
		BDH_VoidStyleLabel(headerWP, "dim")
		headerWP:SetFont(GameFontHighlightMedium:GetFont())
        headerWP:SetWidth(100)
        container:AddChild(headerWP)

        guiCreateNewline(container, 1)

        -- Rows
        for _, wq in ipairs(wqs.worldQuests) do
            local zoneLbl = AceGUI:Create("Label")
            zoneLbl:SetText(wq.zone)
			BDH_VoidStyleLabel(zoneLbl, "secondary")
			zoneLbl:SetFont(GameFontHighlightMedium:GetFont())
			
            zoneLbl:SetWidth(150)
            container:AddChild(zoneLbl)

            local nameLbl = AceGUI:Create("InteractiveLabel")
            nameLbl:SetText("\124cffA335EE" .. wq.title .. "|r")
			nameLbl:SetFont(GameFontHighlightMedium:GetFont())
            nameLbl:SetWidth(200)
			nameLbl:SetCallback("OnEnter", function(widget)
                GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink("quest:" .. wq.questID)
                GameTooltip:Show()
            end)
            nameLbl:SetCallback("OnLeave", function() GameTooltip:Hide() end)
            nameLbl:SetCallback("OnClick", function()
                ToggleWorldMap()
                WorldMapFrame:SetMapID(wq.zoneID)
                C_QuestLog.AddWorldQuestWatch(wq.questID)
            end)
            container:AddChild(nameLbl)
			
            local amountLbl = AceGUI:Create("Label")
            amountLbl:SetText(wq.amount)
            amountLbl:SetWidth(80)
			BDH_VoidStyleLabel(amountLbl, "highlight")
			amountLbl:SetFont(GameFontHighlightMedium:GetFont())
            container:AddChild(amountLbl)

            local wpBtn = AceGUI:Create("Button")
            wpBtn:SetText(LanguageBase[locale]["Wp"])
            wpBtn:SetWidth(100)
            wpBtn:SetCallback("OnClick", function()
			local x, y = C_TaskQuest.GetQuestLocation(wq.questID, wq.zoneID)        
			if x and y then
            setWaypointFromXY("default", wq.zoneID, x * 100, y * 100, wq.title)
			end
			end)
            container:AddChild(wpBtn)
			
			local ttBtn = AceGUI:Create("Button")
            ttBtn:SetText("TomTom")
            ttBtn:SetWidth(100)
            ttBtn:SetCallback("OnClick", function()
			local x, y = C_TaskQuest.GetQuestLocation(wq.questID, wq.zoneID)        
			if x and y then
            setWaypointFromXY("tomtom", wq.zoneID, x * 100, y * 100, wq.title)
			end
			end)
            container:AddChild(ttBtn)
			if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    ttBtn:SetDisabled(true)
            end
			
        end

            guiCreateNewline(container, 5)
	end
	if #wqs.specialAssignments == 0 then
        local noneSA = AceGUI:Create("Label")
        noneSA:SetText(LanguageBase[locale]["No"] .. LanguageBase[locale]["SA"] .. finished .. LanguageBase[locale]["SA3"])
		BDH_VoidStyleLabel(noneSA, "highlight")
		noneSA:SetFont(GameFontHighlightMedium:GetFont())
        noneSA:SetFullWidth(true)
        container:AddChild(noneSA)
    else	
		local specialA = AceGUI:Create("Label")
        specialA:SetText(LanguageBase[locale]["SA"] .. finished .. LanguageBase[locale]["SA3"])
		BDH_VoidStyleLabel(specialA, "dimmer")
		specialA:SetFont(GameFontHighlightLarge:GetFont())
        specialA:SetWidth(500)
        container:AddChild(specialA)
		
		 guiCreateNewline(container, 5)
		
		local headerZone = AceGUI:Create("Label")
        headerZone:SetText(LanguageBase[locale]["Zone"])
		BDH_VoidStyleLabel(headerZone, "dim")
		headerZone:SetFont(GameFontHighlightMedium:GetFont())
        headerZone:SetWidth(150)
        container:AddChild(headerZone)

        local headerName = AceGUI:Create("Label")
        headerName:SetText(LanguageBase[locale]["QName"])
		BDH_VoidStyleLabel(headerName, "dim")
		headerName:SetFont(GameFontHighlightMedium:GetFont())
        headerName:SetWidth(280)
        container:AddChild(headerName)

        local headerWP = AceGUI:Create("Label")
        headerWP:SetText(LanguageBase[locale]["Wp"])
		BDH_VoidStyleLabel(headerWP, "dim")
		headerWP:SetFont(GameFontHighlightMedium:GetFont())
        headerWP:SetWidth(100)
        container:AddChild(headerWP)

        guiCreateNewline(container, 1)
		
		 for _, wq in ipairs(wqs.specialAssignments) do
            local zoneLbl = AceGUI:Create("Label")
            zoneLbl:SetText(wq.zone)
			BDH_VoidStyleLabel(zoneLbl, "secondary")
			zoneLbl:SetFont(GameFontHighlightMedium:GetFont())
			
            zoneLbl:SetWidth(150)
            container:AddChild(zoneLbl)

            local nameLbl = AceGUI:Create("InteractiveLabel")
            nameLbl:SetText("\124cffA335EE" .. wq.title .. "|r")
			nameLbl:SetFont(GameFontHighlightMedium:GetFont())
            nameLbl:SetWidth(280)
			nameLbl:SetCallback("OnEnter", function(widget)
                GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink("quest:" .. wq.questID)
                GameTooltip:Show()
            end)
            nameLbl:SetCallback("OnLeave", function() GameTooltip:Hide() end)
            nameLbl:SetCallback("OnClick", function()
                ToggleWorldMap()
                WorldMapFrame:SetMapID(wq.zoneID)
                C_QuestLog.AddWorldQuestWatch(wq.questID)
            end)
            container:AddChild(nameLbl)

            local wpBtn = AceGUI:Create("Button")
            wpBtn:SetText("Waipoint")
            wpBtn:SetWidth(100)
            wpBtn:SetCallback("OnClick", function()

			local areaLoc = C_AreaPoiInfo.GetAreaPOIInfo(wq.zoneID, wq.poiID)
			if areaLoc then
			local y = areaLoc.position.y
			local x = areaLoc.position.x
			setWaypointFromXY("default", wq.zoneID, x * 100, y * 100, wq.title)
			else
			local x, y = C_TaskQuest.GetQuestLocation(wq.questID, wq.zoneID)
			setWaypointFromXY("default", wq.zoneID, x * 100, y * 100, wq.title)
			end
			end)
            container:AddChild(wpBtn)
			
			local ttBtn = AceGUI:Create("Button")
            ttBtn:SetText("TomTom")
            ttBtn:SetWidth(100)
            ttBtn:SetCallback("OnClick", function()
			local areaLoc = C_AreaPoiInfo.GetAreaPOIInfo(wq.zoneID, wq.poiID)  
			if areaLoc then
			local y = areaLoc.position.y
			local x = areaLoc.position.x
			setWaypointFromXY("tomtom", wq.zoneID, x * 100, y * 100, wq.title)
			else
			local x, y = C_TaskQuest.GetQuestLocation(wq.questID, wq.zoneID)
			setWaypointFromXY("tomtom", wq.zoneID, x * 100, y * 100, wq.title)
			end
			end)
            container:AddChild(ttBtn)
				if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    ttBtn:SetDisabled(true)
				end	
			end
		end
	
		guiCreateNewline(container, 3)
		
		local otherLbl = AceGUI:Create("Label")
        otherLbl:SetText(LanguageBase[locale]["OtherSource"])
        otherLbl:SetWidth(500)
		otherLbl:SetFont(GameFontHighlightLarge:GetFont())
        container:AddChild(otherLbl)
		
		local haradarQ = Count_FinishedQuests(legendRelics);
		local eversongQ = Count_FinishedQuests(saltherilsHaven);
			if eversongQ > 0 then
				everDone = LanguageBase[locale]["Finished"]
			else 
				everDone = LanguageBase[locale]["NotFinished"]
			end
		local preyQ = Count_FinishedQuests(preyQuests)
		
		local haradarQLbl = AceGUI:Create("Label")
        haradarQLbl:SetText(LanguageBase[locale]["OtherText1"] .. haradarQ .. LanguageBase[locale]["OtherText2"] .. everDone .. LanguageBase[locale]["OtherText3"] .. preyQ .. LanguageBase[locale]["OtherText4"])
        haradarQLbl:SetWidth(600)
		BDH_VoidStyleLabel(haradarQLbl, "dim")
		haradarQLbl:SetFont(GameFontHighlightMedium:GetFont())
        container:AddChild(haradarQLbl)
		
		
			
    container:DoLayout()
	end


    function DrawTiersOverviewGroup(container)
	local THBitemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, sellPrice = GetItemInfo(265714)
	local BitemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, sellPrice = GetItemInfo(253342)
	
        guiCreateNewline(container, 3)

        local label = AceGUI:Create("Label")
        label:SetText("Tiers")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
		BDH_VoidStyleLabel(label, "dimmer")
        container:AddChild(label)

        for index = 1, 11 do
            local label = AceGUI:Create("Label")

            if index < 10 then
                label:SetText("  " .. index)
            else
                label:SetText(" " .. index)
            end
			BDH_VoidStyleLabel(label, "dimmer")
            label:SetFont(GameFontHighlightMedium:GetFont())
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container)

        local label = AceGUI:Create("Label")
        label:SetText(LanguageBase[locale]["RGear"])
		BDH_VoidStyleLabel(label, "dim")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
        container:AddChild(label)

        for _, tierDetails in pairs(delveTiers) do
            local label = AceGUI:Create("Label")
            label:SetText(tierDetails["recommendedIlvl"])
            label:SetFont(GameFontHighlightMedium:GetFont())
			BDH_VoidStyleLabel(label, "dim")
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container)

        local label = AceGUI:Create("Label")
        label:SetText(LanguageBase[locale]["BLoot"])
		BDH_VoidStyleLabel(label, "secondary")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
        container:AddChild(label)

        for _, tierDetails in pairs(delveTiers) do
            local label = AceGUI:Create("Label")
            local bountifulLoot = tierDetails["bountifulLootIlvl"]

            label:SetText(getGearColorText(bountifulLoot, bountifulLoot))

            label:SetFont(GameFontHighlightMedium:GetFont())
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container)

        local label = AceGUI:Create("Label")
        label:SetText(LanguageBase[locale]["GV"])
		BDH_VoidStyleLabel(label, "highlight")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetWidth(160)
        container:AddChild(label)

        for _, tierDetails in pairs(delveTiers) do
            local label = AceGUI:Create("Label")
            label:SetText(tierDetails["vaultIlvl"])
			BDH_VoidStyleLabel(label, "highlight")
            label:SetFont(GameFontHighlightMedium:GetFont())
            label:SetWidth(40)
            container:AddChild(label)
        end

        guiCreateNewline(container, 15)
	
        local nemesisLbl = AceGUI:Create("Label")
        nemesisLbl:SetText(LanguageBase[locale]["Nemesis"])
        nemesisLbl:SetFont(GameFontHighlightLarge:GetFont())
        nemesisLbl:SetWidth(300)
        container:AddChild(nemesisLbl)
		
		local nemesisLbl = AceGUI:Create("Label")
        nemesisLbl:SetText(LanguageBase[locale]["Zone"])
        nemesisLbl:SetFont(GameFontHighlightLarge:GetFont())
        nemesisLbl:SetWidth(200)
        container:AddChild(nemesisLbl)
				
		local row = AceGUI:Create("SimpleGroup")
		row:SetLayout("Manual") 
		row:SetWidth(400)
		row:SetHeight(80) 
		container:AddChild(row)
		
		SeasonNemesisIcon =  "Interface\\Icons\\inv_grovecrawlermount_red" --"Interface\\Icons\\Inv_120_raid_voidspire_hostgeneral"
        local nemesisIcon = AceGUI:Create("Icon")
		nemesisIcon:SetImage(SeasonNemesisIcon)
        nemesisIcon:SetImageSize(64, 64)
        nemesisIcon:SetLabel("Azta'rec")
		BDH_VoidStyleLabel(nemesisIcon, "highlight")
        nemesisIcon:SetWidth(80)
        row:AddChild(nemesisIcon)
		nemesisIcon.frame:SetPoint("TOPLEFT", row.content, "TOPLEFT", 0, 0)
		
		nemesisQ = C_QuestLog.IsQuestFlaggedCompleted(97482) -- (93525)
		nemesisInLog = C_QuestLog.IsOnQuest(97482) --(93525) 
		if nemesisQ then qText = LanguageBase[locale]["QDone"]
		elseif nemesisInLog then 
				qText = LanguageBase[locale]["QLog"]
		else qText = LanguageBase[locale]["QNot"]
		end
		
		local nullaeussLbl = AceGUI:Create("Label")
		nullaeussLbl.frame:ClearAllPoints()
		nullaeussLbl.frame:SetPoint("TOPLEFT", nemesisIcon.image, "TOPRIGHT", 5, 0)
        nullaeussLbl:SetText(qText)
		BDH_VoidStyleLabel(nullaeussLbl, "primary")
        nullaeussLbl:SetFont(GameFontHighlightMedium:GetFont())
        nullaeussLbl:SetWidth(220)
        row:AddChild(nullaeussLbl)
		nullaeussLbl.frame:ClearAllPoints()
		nullaeussLbl.frame:SetPoint("TOPLEFT", nemesisIcon.image, "TOPRIGHT", 5, 0)
		
		local zoneLbl = AceGUI:Create("Label")
        zoneLbl:SetText(areaIDs[2512])
		zoneLbl.frame:ClearAllPoints()
		zoneLbl.frame:SetPoint("TOPLEFT", nullaeussLbl.frame, "TOPRIGHT", 10, 0)
		BDH_VoidStyleLabel(zoneLbl, "dim")
        zoneLbl:SetFont(GameFontHighlightMedium:GetFont())
        zoneLbl:SetWidth(80)
        row:AddChild(zoneLbl)
		zoneLbl.frame:ClearAllPoints()
		zoneLbl.frame:SetPoint("TOPLEFT", nemesisLbl.frame, "BOTTOMLEFT", 0, -8)
		
		local x, y = 51.2, 30.3
		local nmZone = 2512 --2405
		local nmBtn = AceGUI:Create("Button")
            nmBtn:SetText(LanguageBase[locale]["Wp"])
            nmBtn:SetWidth(100)
            nmBtn:SetCallback("OnClick", function()
            setWaypointFromXY("default", nmZone, x , y , "Venomfall Deeps")
			end)
            container:AddChild(nmBtn)
			
			local ttBtn = AceGUI:Create("Button")
            ttBtn:SetText("TomTom")
            ttBtn:SetWidth(100)
            ttBtn:SetCallback("OnClick", function()        
            setWaypointFromXY("tomtom", nmZone, x , y , "Venomfall Deeps")
			end)
            container:AddChild(ttBtn)
				if C_AddOns.IsAddOnLoaded("TomTom") == false then
                    ttBtn:SetDisabled(true)
				end	
		guiCreateNewline(container, 5)
				
		local TroveLbl = AceGUI:Create("Label")
		if THBitemName ~= nil then
        TroveLbl:SetText("\124cff3088E0" .. THBitemName)
		else
		TroveLbl:SetText("\124cff3088E0 Trovehunter'*s Bounty")
		end
        TroveLbl:SetFont(GameFontHighlightLarge:GetFont())
        TroveLbl:SetWidth(300)
        container:AddChild(TroveLbl)
		
		local row2 = AceGUI:Create("SimpleGroup")
		row2:SetLayout("Manual") 
		row2:SetWidth(400)
		row2:SetHeight(80) 
		container:AddChild(row2)
		
		local mapID = 252415
		--local mapItemId = 265714
		local mapIcon = 1064187
        local delverBountyIcon = AceGUI:Create("Icon")
		delverBountyIcon:SetImage(mapIcon)
        delverBountyIcon:SetImageSize(64, 64)
		BDH_VoidStyleLabel(delverBountyIcon, "highlight")
        delverBountyIcon:SetWidth(80)
        row2:AddChild(delverBountyIcon)
		delverBountyIcon.frame:SetPoint("TOPLEFT", row2.content, "TOPLEFT", 0, 0)
		delverBountyIcon:SetCallback("OnEnter", function(widget)
					GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT")
					GameTooltip:SetHyperlink("item:" .. TROVEHUNTER_BOUNTY_ITEMID)
					GameTooltip:Show()
            end)
            delverBountyIcon:SetCallback("OnLeave", function() GameTooltip:Hide() end)
			
		delverBountyQ = C_QuestLog.IsQuestFlaggedCompleted(86371)
		delverBountyinBag = PlayerHasBounty() --C_Item.GetItemCount(mapID) 
		delverBountyActive = C_UnitAuras.GetPlayerAuraBySpellID(1254631)
		local safeItemName = THBitemName or "Trove Hunter's Bounty"
		if delverBountyQ then qText = safeItemName .. LanguageBase[locale]["THBLooted"]
		else qText = safeItemName .. LanguageBase[locale]["THBNotLooted"]
		end
		if delverBountyinBag and not delverBountyActive then 
				qText = qText .. safeItemName .. LanguageBase[locale]["THBBag"]
		elseif delverBountyActive then qText = qText .. safeItemName .. LanguageBase[locale]["THBActive"]
		end
		
		local delverBountyLbl = AceGUI:Create("Label")
        delverBountyLbl:SetText(qText)
		BDH_VoidStyleLabel(delverBountyLbl, "primary")
        delverBountyLbl:SetFont(GameFontHighlightMedium:GetFont())
        delverBountyLbl:SetWidth(320)
        row2:AddChild(delverBountyLbl)
		delverBountyLbl.frame:ClearAllPoints()
		delverBountyLbl.frame:SetPoint("TOPLEFT", delverBountyIcon.image, "TOPRIGHT", 5, 0)
		
		guiCreateNewline(container, 5)
		local beaconHeadLbl = AceGUI:Create("Label")
        beaconHeadLbl:SetText("\124cff3088E0" .. BitemName)
        beaconHeadLbl:SetFont(GameFontHighlightLarge:GetFont())
        beaconHeadLbl:SetWidth(300)
        container:AddChild(beaconHeadLbl)
		
		local row3 = AceGUI:Create("SimpleGroup")
		row3:SetLayout("Manual") 
		row3:SetWidth(400)
		row3:SetHeight(80) 
		container:AddChild(row3)
		
		local beaconId = 253342
		local beaconIcn = GetItemIcon(beaconId)
        local beaconIcon = AceGUI:Create("Icon")
		beaconIcon:SetImage(beaconIcn)
        beaconIcon:SetImageSize(64, 64)
		BDH_VoidStyleLabel(beaconIcon, "highlight")
        beaconIcon:SetWidth(80)
        row3:AddChild(beaconIcon)
		beaconIcon.frame:SetPoint("TOPLEFT", row3.content, "TOPLEFT", 0, 0)
				beaconIcon:SetCallback("OnEnter", function(widget)
					GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT")
					GameTooltip:SetHyperlink("item:" .. beaconId)
					GameTooltip:Show()
            end)
            beaconIcon:SetCallback("OnLeave", function() GameTooltip:Hide() end)
		
		beaconPrice = 5000
		beaconinBag = C_Item.GetItemCount(beaconId, includeBank) 
		underCoin = C_CurrencyInfo.GetCurrencyInfo(2803)
		if beaconinBag > 0 then qText = BitemName .. LanguageBase[locale]["BeaconInBag"]
		elseif underCoin.quantity < 5000 then qText = LanguageBase[locale]["No"] .. BitemName .. LanguageBase[locale]["BeaconNoNo"] .. underCoin.quantity .. "|r / |cffFFFFFF" .. beaconPrice .. ")"
		else qText = LanguageBase[locale]["No"] .. BitemName .. LanguageBase[locale]["BeaconNoYes"] .. underCoin.quantity .. " / |cffFFFFFF" .. beaconPrice .. ")"
		end
		
		local beaconLbl = AceGUI:Create("Label")
        beaconLbl:SetText(qText)
		BDH_VoidStyleLabel(beaconLbl, "primary")
        beaconLbl:SetFont(GameFontHighlightMedium:GetFont())
        beaconLbl:SetWidth(320)
        row3:AddChild(beaconLbl)
		beaconLbl.frame:ClearAllPoints()
		beaconLbl.frame:SetPoint("TOPLEFT", beaconIcon.image, "TOPRIGHT", 5, 0)
		
		
    end

    local function SelectGroup(container, event, group)
        container:ReleaseChildren()
        if group == "tab1" then
            DrawDelvesGroup(container)
        elseif group == "tab2" then
            DrawTiersOverviewGroup(container)
        elseif group == "tab3" then
            DrawOptionsOverviewGroup(container)
		elseif group == "tab3" then
            DrawAllDelvesGroupGroup(container)
        end
    end

    BountifulDelvesHunterMainFrame = AceGUI:Create("Frame")
	BountifulDelvesHunterMainFrame:EnableResize(false)
	BountifulDelvesHunterMainFrame:SetTitle(LanguageBase[locale]["Title"])
	BountifulDelvesHunterMainFrame:SetStatusText(LanguageBase[locale]["Title"] .. " - " .. version)
	BDH_VoidStyleFrame(BountifulDelvesHunterMainFrame, "darkest")
	BountifulDelvesHunterMainFrame:SetCallback("OnClose", function(widget)
    isFrameVisible = false
	end)
	if BountifulDelvesHunterDB.TWW == true then 
	BountifulDelvesHunterMainFrame:SetHeight(1000)
	else
	BountifulDelvesHunterMainFrame:SetHeight(700)
	end
	BountifulDelvesHunterMainFrame:SetLayout("Fill")

	local frame = BountifulDelvesHunterMainFrame.frame

	setBackdropColor(frame, VOID_THEME.bg_darkest)
	setBackdropBorderColor(frame, VOID_THEME.border_glow)


	frame:SetBackdropBorderColor(
    VOID_THEME.border_glow[1],
    VOID_THEME.border_glow[2],
    VOID_THEME.border_glow[3],
    VOID_THEME.border_glow[4]
)

    local tab = AceGUI:Create("TabGroup")
	setBackdropColor(tab.frame, VOID_THEME.bg_medium)
	setBackdropBorderColor(tab.frame, VOID_THEME.border_void)
    tab:SetLayout("Flow")
    tab:SetTabs({
        { text = LanguageBase[locale]["Unselect1"],	value = "tab1" },
        { text = LanguageBase[locale]["Unselect2"], value = "tab2" },
        { text = LanguageBase[locale]["Unselect3"],	value = "tab4" },
		{ text = LanguageBase[locale]["Unselect4"], value = "tab5" },	
        { text = LanguageBase[locale]["Unselect5"], value = "tab3" }
    })
    tab:SetCallback("OnGroupSelected", function(container, event, group)
        container:ReleaseChildren()
        if group == "tab1" then
            DrawDelvesGroup(container)
			tab:SetTabs({
        { text = LanguageBase[locale]["Select1"], value = "tab1" },
        { text = LanguageBase[locale]["Unselect2"], value = "tab2" },
        { text = LanguageBase[locale]["Unselect3"], value = "tab4" },   
 		{ text = LanguageBase[locale]["Unselect4"], value = "tab5" },
		{ text = LanguageBase[locale]["Unselect5"], value = "tab3" }
    })	
        elseif group == "tab2" then
            DrawTiersOverviewGroup(container)
			tab:SetTabs({
        { text = LanguageBase[locale]["Unselect1"], value = "tab1" },
        { text = LanguageBase[locale]["Select2"], value = "tab2" },
        { text = LanguageBase[locale]["Unselect3"], value = "tab4" },   
 		{ text = LanguageBase[locale]["Unselect4"], value = "tab5" },
		{ text = LanguageBase[locale]["Unselect5"], value = "tab3" }
		})
        elseif group == "tab4" then
            DrawCofferShardsWQGroup(container)
			tab:SetTabs({
        { text = LanguageBase[locale]["Unselect1"], value = "tab1" },
        { text = LanguageBase[locale]["Unselect2"], value = "tab2" },
        { text = LanguageBase[locale]["Select3"], value = "tab4" },   
 		{ text = LanguageBase[locale]["Unselect4"], value = "tab5" },
		{ text = LanguageBase[locale]["Unselect5"], value = "tab3" }
		})
        elseif group == "tab3" then
            DrawOptionsOverviewGroup(container)
			tab:SetTabs({
        { text = LanguageBase[locale]["Unselect1"], value = "tab1" },
        { text = LanguageBase[locale]["Unselect2"], value = "tab2" },
        { text = LanguageBase[locale]["Unselect3"], value = "tab4" },   
 		{ text = LanguageBase[locale]["Unselect4"], value = "tab5" },
		{ text = LanguageBase[locale]["Select5"], value = "tab3" }
		})	
		elseif group == "tab5" then
            DrawAllDelvesGroup(container)
			tab:SetTabs({
        { text = LanguageBase[locale]["Unselect1"], value = "tab1" },
        { text = LanguageBase[locale]["Unselect2"], value = "tab2" },
        { text = LanguageBase[locale]["Unselect3"], value = "tab4" },   
 		{ text = LanguageBase[locale]["Select4"], value = "tab5" },
		{ text = LanguageBase[locale]["Unselect5"], value = "tab3" }		})	
        end
    end)
    tab:SelectTab("tab4")
	tab:SelectTab("tab1")

    BountifulDelvesHunterMainFrame:AddChild(tab)

    _G["BountifulDelvesHunterGlobalFrame"] = BountifulDelvesHunterMainFrame.frame
    tinsert(UISpecialFrames, "BountifulDelvesHunterGlobalFrame")
end

function DrawOptionsOverviewGroup(container)
    guiCreateNewline(container, 3)

    local button = AceGUI:Create("Button")
	local function UpdateButtonText()
		if BountifulDelvesHunterIconDB.hide == false then 
		button:SetText(LanguageBase[locale]["MiniMap"] .. " " .. LanguageBase[locale]["on"])
		else 
		button:SetText(LanguageBase[locale]["MiniMap"] .. " " .. LanguageBase[locale]["off"])
		end
	end
	
UpdateButtonText()
    button:SetWidth(250)
    button:SetCallback("OnClick", function()
        if BountifulDelvesHunterIconDB.hide == true then
            BountifulDelvesHunterMinimapButton:Show("BountifulDelvesHunter")
            BountifulDelvesHunterIconDB.hide = false
			UpdateButtonText()
        else
            BountifulDelvesHunterMinimapButton:Hide("BountifulDelvesHunter")
            BountifulDelvesHunterIconDB.hide = true
			UpdateButtonText()
        end
    end)
    container:AddChild(button)
	
--	guiCreateNewline(container, 3)
	
	local button = AceGUI:Create("Button")
	local function UpdateButtonText()
		if BountifulDelvesHunterDB.TWW == false then 
		button:SetText(LanguageBase[locale]["ToggleLegacy"] .. " " .. LanguageBase[locale]["off"])		
		else 
		button:SetText(LanguageBase[locale]["ToggleLegacy"] .. " " .. LanguageBase[locale]["on"])		
		end
	end
	
	UpdateButtonText()		
    button:SetWidth(250)
    button:SetCallback("OnClick", function()
        if BountifulDelvesHunterDB.TWW == true then
           BountifulDelvesHunterDB.TWW = false
		   BountifulDelvesHunterMainFrame:SetHeight(700)
		   UpdateButtonText()
        else
            BountifulDelvesHunterDB.TWW = true
			BountifulDelvesHunterMainFrame:SetHeight(1100)
			UpdateButtonText()
        end
    end)
    container:AddChild(button)
	
	guiCreateNewline(container, 3)
	
	local button = AceGUI:Create("Button")
	local function UpdateButtonText()
		if BountifulDelvesHunterDB.reminder_restoration == false then 
        button:SetText(LanguageBase[locale]["Restoration_Warning"] .. " " .. LanguageBase[locale]["off"])
		else 
        button:SetText(LanguageBase[locale]["Restoration_Warning"] .. " " .. LanguageBase[locale]["on"])
		end
	end

	UpdateButtonText()
    
    button:SetWidth(250)
    button:SetCallback("OnClick", function()
        if BountifulDelvesHunterDB.reminder_restoration == true then
           BountifulDelvesHunterDB.reminder_restoration = false	
			UpdateButtonText()
        else
            BountifulDelvesHunterDB.reminder_restoration = true
			UpdateButtonText()
        end
    end)
    container:AddChild(button)
	
	guiCreateNewline(container, 3)
	
	local dropdown = AceGUI:Create("Dropdown")
		dropdown:SetLabel(LanguageBase[locale]["ChLang"])
		dropdown:SetList(dropDownOptionen)
		dropdown:SetWidth(150)
		dropdown:SetValue(BountifulDelvesHunterDB.locale) 
		dropdown:SetCallback("OnValueChanged", function(widget, event, key)
			if key == "follow" and dropDownOptionen[GetLocale()] then
				BountifulDelvesHunterDB.locale = GetLocale()
			else
				BountifulDelvesHunterDB.locale = key
			end

		end)	
		container:AddChild(dropdown)
		
		guiCreateNewline(container, 3)
	
	local reminder = AceGUI:Create("Label")
        reminder:SetText(LanguageBase[locale]["remind"])
		BDH_VoidStyleLabel(label, "dim")
        reminder:SetFont(GameFontHighlightSmall:GetFont())
        reminder:SetWidth(600)
        container:AddChild(reminder)
	
		guiCreateNewline(container, 8)
	
	 local label = AceGUI:Create("Label")
        label:SetText(LanguageBase[locale]["OptionText"])
		BDH_VoidStyleLabel(label, "dimmer")
        label:SetFont(GameFontHighlightMedium:GetFont())
        label:SetFullWidth(true)
        container:AddChild(label)
	

end

function triggerFrame()
    if not isFrameVisible then
        showUI()
        isFrameVisible = true
    else
        BountifulDelvesHunterMainFrame:Hide()
        isFrameVisible = false
    end
end

function BountifulDelvesHunter:ToggleMainFrame()
    triggerFrame()
end

SlashCmdList["BDH"] = function(arg1)
    if arg1 == "hide" and BountifulDelvesHunterIconDB["hide"] == false or BountifulDelvesHunterIconDB["hide"] == nil then
        BountifulDelvesHunterIconDB["hide"] = true
        print(LanguageBase[locale]["MiniHidden"])
    elseif arg1 == "show" and BountifulDelvesHunterIconDB["hide"] == true then
        BountifulDelvesHunterIconDB["hide"] = false
        print(LanguageBase[locale]["MiniShown"])
    elseif arg1 == "" then
        if not isFrameVisible then
            showUI()
            isFrameVisible = true
        end
    end
end

local eventListenerFrame = CreateFrame("Frame", "BountifulDelvesHunterListenerFrame")
local function eventHandler(self, event, arg1)
    if event == "GOSSIP_SHOW" and arg1 == "delves-difficulty-picker" then
        local highestTier = 1
        for index, data in pairs(DelvesDifficultyPickerFrame:GetOptions()) do
            if data["status"] == 0 then
                highestTier = index
            end
        end
    end
end

local hasActivatedStone = false

local function OnRestorationStoneReached()
    -- Your custom logic goes here
    print("Empowered Restoration Stone reached! Life added, spawn point updated.")
    
    -- Insert your WeakAura trigger, audio alert, or UI pop-up code here
end



frame:SetScript("OnEvent", function(self, event, ...)
    	
    if event == "ZONE_CHANGED_NEW_AREA" then
        popupShown = false
		C_Timer.After(5, function() end)
local a = IsInDelve()
local b = PlayerHasBounty()
--print (a)
--print (b)
        if IsInDelve() and PlayerHasBounty() then
            TryShowPopup()
        end

    elseif event == "PLAYER_REGEN_ENABLED" then

        if pendingPopup then
            pendingPopup = false
            TryShowPopup()
        end
		        
    elseif event == "DISPLAY_EVENT_TOAST_LINK" then
        
        local toastText = ...   
        if toastText and string.find(toastText, "Respawn Point") or string.find(toastText, "Wiederbelebungspunkt") or string.find(toastText, "Point d’apparition") or string.find(toastText, "Punto de reaparición") or string.find(toastText, "Punto di Ricomparsa") or string.find(toastText, "Ponto de Reaparecimento") and PlayerHasBounty and BountifulDelvesHunterDB.reminder_restoration then  
            TryShowPopup()
        end
    end
end)

eventListenerFrame:SetScript("OnEvent", eventHandler)
eventListenerFrame:RegisterEvent("GOSSIP_SHOW")

