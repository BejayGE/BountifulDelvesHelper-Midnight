VOID_THEME = {
    bg_darkest        = {0.04, 0.02, 0.10, 0.97},
    bg_dark           = {0.08, 0.05, 0.18, 0.95},
    bg_medium         = {0.12, 0.08, 0.25, 0.90},
    bg_light          = {0.18, 0.12, 0.35, 0.85},

    border_void       = {0.55, 0.15, 0.85, 0.80},
    border_glow       = {0.70, 0.40, 1.00, 0.70},
    border_dim        = {0.35, 0.10, 0.55, 0.60},

    text_primary      = {0.92, 0.88, 1.00, 1.00},
    text_secondary    = {0.75, 0.70, 0.90, 1.00},
    text_dim          = {0.60, 0.55, 0.75, 1.00},
    text_highlight    = {0.95, 0.85, 1.00, 1.00},

    button_bg_normal  = {0.20, 0.14, 0.38, 0.95},
    button_bg_active  = {0.40, 0.25, 0.65, 1.00},
    button_border     = {0.65, 0.30, 1.00, 0.75},

    shards_amount     = {0.85, 0.70, 1.00, 1.00},
    time_left         = {0.60, 0.85, 1.00, 1.00},
}

areaIDs = {
    [2248] = "Isle Of Dorn",
    [2215] = "Hallowfall",
    [2214] = "Ringing Deeps",
    [2255] = "Azj-Kahet",
    [2346] = "Undermine",
    [2371] = "K'aresh",
    [2395] = "Eversong Woods",
    [2413] = "Harandar",
    [2405] = "Voidstorm",
    [2437] = "Zul'Aman",
    [2393] = "Silvermoon",
	[2424] = "Isle of Quel'Danas"
}

waypoints = {
	--Isle of Quel'Danas
	-- "Parhelion Plaza"
	[8428] = { ["zone"] = 2424, ["x"] = 46.3, ["y"] = 41.62 },
    --Eversong Woods
    -- "The Shadow Enclave"
    [8438] = { ["zone"] = 2395, ["x"] = 45.4, ["y"] = 86.0 },
    --Zul'Aman
	-- "Atal'Aman"
    [8444] = { ["zone"] = 2437, ["x"] = 24.8, ["y"] = 53.0 },
    -- "Twilight Crypt"
    [8442] = { ["zone"] = 2437, ["x"] = 25.4, ["y"] = 84.3 },
    --Voidstorm
    -- "Shadowguard Point"
    [8432] = { ["zone"] = 2405, ["x"] = 37.38, ["y"] = 47.7 },
    -- "Sunkiller Sanctum"
    [8430] = { ["zone"] = 2405, ["x"] = 54.8, ["y"] = 47.0 },
    --Harandar
    -- "The Gulf of Memory"
    [8436] = { ["zone"] = 2413, ["x"] = 36.3, ["y"] = 49.2 },
    -- "The Grudge Pit"
    [8434] = { ["zone"] = 2413, ["x"] = 70.5, ["y"] = 64.92 },
    --Silvermoon
    -- "Collegiate Calamity"
    [8426] = { ["zone"] = 2393, ["x"] = 40.76, ["y"] = 54.06 },
    -- "The Darkway"
    [8440] = { ["zone"] = 2393, ["x"] = 39.3, ["y"] = 31.8 },
	
	--Isle of Dorn
    -- "Earthcrawl Mines"
    [7787] = { ["zone"] = 2248, ["x"] = 38.6, ["y"] = 74.0 },
    -- "Fungal Folly"
    [7779] = { ["zone"] = 2248, ["x"] = 52.03, ["y"] = 65.77 },
    -- "Kriegval's Rest"
    [7781] = { ["zone"] = 2248, ["x"] = 62.19, ["y"] = 42.70 },
    --The Ringing Deeps
    -- "The Waterworks"
    [7782] = { ["zone"] = 2214, ["x"] = 42.15, ["y"] = 48.71 },
    -- "The Dread Pit"
    [7788] = { ["zone"] = 2214, ["x"] = 70.20, ["y"] = 37.3 },
    -- "Excavation Site 9"
    [8181] = { ["zone"] = 2214, ["x"] = 76.0, ["y"] = 96.50 },
    --Hallowfall
    -- "Mycomancer Cavern"
    [7780] = { ["zone"] = 2215, ["x"] = 71.3, ["y"] = 31.2 },
    -- "Nightfall Sanctum"
    [7785] = { ["zone"] = 2215, ["x"] = 34.32, ["y"] = 47.43 },
    -- "The Sinkhole"
    [7783] = { ["zone"] = 2215, ["x"] = 50.6, ["y"] = 53.3 },
    -- "Skittering Breach"
    [7789] = { ["zone"] = 2215, ["x"] = 65.48, ["y"] = 61.74 },
    --Azj-Kahet
    -- "The Spiral Weave"
    [7790] = { ["zone"] = 2255, ["x"] = 45.0, ["y"] = 19.0 },
    -- "Tak-Rethan Abyss"
    [7784] = { ["zone"] = 2255, ["x"] = 55.0, ["y"] = 73.92 },
    -- "The Underkeep"
    [7786] = { ["zone"] = 2255, ["x"] = 51.85, ["y"] = 88.30 },
    --Undermine
    -- "Sidestreet Sluice"
    [8246] = { ["zone"] = 2346, ["x"] = 35.20, ["y"] = 52.80 },
    -- "Demolition Dome"
    [8246] = { ["zone"] = 2346, ["x"] = 50.30, ["y"] = 9.60 },
    --K'aresh
    -- "Archival Assault"
    [8273] = { ["zone"] = 2371, ["x"] = 55.00, ["y"] = 48.00 }
}

worldQuestsIDs = {
    [93013] = {["saTitle"] = "Special Assignment: Push back the Light", ["saAreaPoid"] = 8524},
    [92063] = {["saTitle"] = "Special Assignment: A Hunter's Regret", ["saAreaPoid"] = 8523},
    [92145] = {["saTitle"] = "Special Assignment: The Grand Magister's Drink", ["saAreaPoid"] = 8471 },
 --   [91793] = {["saTitle"] ="Special Assignment: Into the Depths", ["saAreaPoid"] = ,
    [91796] = {["saTitle"] = "Special Assignment: Ours Once More!", ["saAreaPoid"] = 8612 },
    [93244] = {["saTitle"] = "Special Assignment: Agents of the Shield", ["saAreaPoid"] = 8588 },
	[92139] = {["saTitle"] = "Special Assignment: Shade and Claw", ["saAreaPoid"] = 8695 },
	[91390] = {["saTitle"] = "Special Assignment: What Remains of a Temple Broken", ["saAreaPoid"] = 8611 },
	[93438] = {["saTitle"] = "Special Assignment: Precision Excision", ["saAreaPoid"] = 8585 }
}
	
delveTiers = {
    { ["bountifulLootIlvl"] = 220, ["recommendedIlvl"] = 170, ["vaultIlvl"] = 233 },
    { ["bountifulLootIlvl"] = 224, ["recommendedIlvl"] = 187, ["vaultIlvl"] = 237 },
    { ["bountifulLootIlvl"] = 227, ["recommendedIlvl"] = 200, ["vaultIlvl"] = 240 },
    { ["bountifulLootIlvl"] = 230, ["recommendedIlvl"] = 213, ["vaultIlvl"] = 243 },
    { ["bountifulLootIlvl"] = 233, ["recommendedIlvl"] = 222, ["vaultIlvl"] = 246 },
    { ["bountifulLootIlvl"] = 237, ["recommendedIlvl"] = 229, ["vaultIlvl"] = 253 },
    { ["bountifulLootIlvl"] = 246, ["recommendedIlvl"] = 235, ["vaultIlvl"] = 256 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 244, ["vaultIlvl"] = 259 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 250, ["vaultIlvl"] = 259 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 257, ["vaultIlvl"] = 259 },
    { ["bountifulLootIlvl"] = 250, ["recommendedIlvl"] = 265, ["vaultIlvl"] = 259 }
}
waypoints_all = {
	--Isle of Quel'Danas
	-- "Parhelion Plaza"
	["Parhelion Plaza"] = { ["zone"] = 2424, ["x"] = 46.3, ["y"] = 41.62 },
    --Eversong Woods
    -- "The Shadow Enclave"
    ["The Shadow Enclave"] = { ["zone"] = 2395, ["x"] = 45.4, ["y"] = 86.0 },
    --Zul'Aman
	-- "Atal'Aman"
    ["Atal'Aman"] = { ["zone"] = 2437, ["x"] = 24.8, ["y"] = 53.0 },
    -- "Twilight Crypt"
    ["Twilight Crypt"] = { ["zone"] = 2437, ["x"] = 25.4, ["y"] = 84.3 },
    --Voidstorm
    -- "Shadowguard Point"
    ["Shadowguard Point"] = { ["zone"] = 2405, ["x"] = 37.38, ["y"] = 47.7 },
    -- "Sunkiller Sanctum"
    ["Sunkiller Sanctum"] = { ["zone"] = 2405, ["x"] = 54.8, ["y"] = 47.0 },
    --Harandar
    -- "The Gulf of Memory"
    ["The Gulf of Memory"] = { ["zone"] = 2413, ["x"] = 36.3, ["y"] = 49.2 },
    -- "The Grudge Pit"
    ["The Grudge Pit"] = { ["zone"] = 2413, ["x"] = 70.5, ["y"] = 64.92 },
    --Silvermoon
    -- "Collegiate Calamity"
    ["Collegiate Calamity"] = { ["zone"] = 2393, ["x"] = 40.76, ["y"] = 54.06 },
    -- "The Darkway"
    ["The Darkway"] = { ["zone"] = 2393, ["x"] = 39.3, ["y"] = 31.8 },
		--Isle of Dorn
    -- "Earthcrawl Mines"
    ["Earthcrawl Mines"] = { ["zone"] = 2248, ["x"] = 38.6, ["y"] = 74.0 },
    -- "Fungal Folly"
    ["Fungal Folly"] = { ["zone"] = 2248, ["x"] = 52.03, ["y"] = 65.77 },
    -- "Kriegval's Rest"
    ["Kriegval's Rest"] = { ["zone"] = 2248, ["x"] = 62.19, ["y"] = 42.70 },
    --The Ringing Deeps
    -- "The Waterworks"
    ["The Waterworks"] = { ["zone"] = 2214, ["x"] = 42.15, ["y"] = 48.71 },
    -- "The Dread Pit"
    ["The Dread Pit"] = { ["zone"] = 2214, ["x"] = 70.20, ["y"] = 37.3 },
    -- "Excavation Site 9"
    ["Excavation Site 9"] = { ["zone"] = 2214, ["x"] = 76.0, ["y"] = 96.50 },
    --Hallowfall
    -- "Mycomancer Cavern"
    ["Mycomancer Cavern"] = { ["zone"] = 2215, ["x"] = 71.3, ["y"] = 31.2 },
    -- "Nightfall Sanctum"
    ["Nightfall Sanctum"] = { ["zone"] = 2215, ["x"] = 34.32, ["y"] = 47.43 },
    -- "The Sinkhole"
    ["The Sinkhole"] = { ["zone"] = 2215, ["x"] = 50.6, ["y"] = 53.3 },
    -- "Skittering Breach"
    ["Skittering Breach"] = { ["zone"] = 2215, ["x"] = 65.48, ["y"] = 61.74 },
    --Azj-Kahet
    -- "The Spiral Weave"
    ["The Spiral Weave"] = { ["zone"] = 2255, ["x"] = 45.0, ["y"] = 19.0 },
    -- "Tak-Rethan Abyss"
    ["Tak-Rethan Abyss"] = { ["zone"] = 2255, ["x"] = 55.0, ["y"] = 73.92 },
    -- "The Underkeep"
    ["The Underkeep"] = { ["zone"] = 2255, ["x"] = 51.85, ["y"] = 88.30 },
    --Undermine
    -- "Sidestreet Sluice"
    ["Sidestreet Sluice"] = { ["zone"] = 2346, ["x"] = 35.20, ["y"] = 52.80 },
    -- "Demolition Dome"
    ["Demolition Dome"] = { ["zone"] = 2346, ["x"] = 50.30, ["y"] = 9.60 },
    --K'aresh
    -- "Archival Assault"
    ["Archival Assault"] = { ["zone"] = 2371, ["x"] = 55.00, ["y"] = 48.00 }
	
	}
	
	DelveStoryTiers = {
    ["Collegiate Calamity"] = {
        ["Invasive Glow"] = "\124cffFF9C00S-Tier",
        ["Academy Under Siege"] = "\124cffa335eeA-Tier",
        ["Faculty of Fear"] = "\124cff0070ddB-Tier",
    },

    ["The Darkway"] = {
        ["Ogre Powered"] = "\124cffa335eeA-Tier",
        ["Focusers Under Pressure"] = "\124cff0070ddB-Tier",
        ["Leyline Technician"] = "D-Tier",
    },

    ["The Gulf of Memory"] = {
        ["Sporasaur Special"] = "\124cffa335eeA-Tier",
        ["Alnmoth Munchies"] = "\124cff1eff00C-Tier",
        ["Descent of the Haranir"] = "D-Tier",
    },

    ["Parhelion Plaza"] = {
        ["Holding the Line"] = "\124cffa335ee\124cffa335eeA-Tier",
        ["March of the Arcane Brigade"] = "\124cff9d9d9dF-Tier",
        ["Bombing Run"] = "\124cff9d9d9dF-Tier",
    },

    ["Sunkiller Sanctum"] = {
        ["Core of the Problem"] = "\124cff0070ddB-Tier",
        ["Not What I Expected"] = "\124cff1eff00C-Tier",
        ["The Gravitational Effect"] = "D-Tier",
    },

    ["Twilight Crypts"] = {
        ["Party Crasher"] = "\124cff0070ddB-Tier",
        ["Trapped"] = "\124cff1eff00C-Tier",
        ["Loosed Loa"] = "D-Tier",
    },

    ["Atal'Aman"] = {
        ["Toadly Unbecoming"] = "\124cff0070ddB-Tier",
        ["Totem Annihilation"] = "\124cff1eff00C-Tier",
        ["Ritual Interrupted"] = "D-Tier",
    },

    ["The Shadow Enclave"] = {
        ["Traitor's Due"] = "\124cff1eff00C-Tier",
        ["Mirror Shine"] = "\124cff9d9d9dF-Tier",
        ["Shadowy Supplies"] = "\124cff9d9d9dF-Tier",
    },

    ["Shadowguard Point"] = {
        ["Calamitous"] = "D-Tier",
        ["Captured Wildlife"] = "\124cff9d9d9dF-Tier",
		["Captured Widlife"] = "\124cff9d9d9dF-Tier",
        ["Stolen Mana"] = "\124cff9d9d9dF-Tier",
    },

    ["The Grudge Pit"] = {
        ["Arena Champion"] = "D-Tier",
        ["Lightbloom Invasion"] = "\124cff9d9d9dF-Tier",
        ["Dastardly Rotstalk"] = "\124cff9d9d9dF-Tier",
    }
}

	
