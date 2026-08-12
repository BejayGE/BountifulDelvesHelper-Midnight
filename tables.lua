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
    [2248] = C_Map.GetMapInfo(2248).name,	--"Isle Of Dorn",
    [2215] = C_Map.GetMapInfo(2215).name,	--"Hallowfall",
    [2214] = C_Map.GetMapInfo(2214).name,	--"Ringing Deeps",
    [2255] = C_Map.GetMapInfo(2255).name,	--"Azj-Kahet",
    [2346] = C_Map.GetMapInfo(2346).name,	--"Undermine",
    [2371] = C_Map.GetMapInfo(2371).name,	--"K'aresh",
    [2395] = C_Map.GetMapInfo(2395).name,	--"Eversong Woods",
    [2413] = C_Map.GetMapInfo(2413).name,	--"Harandar",
    [2405] = C_Map.GetMapInfo(2405).name,	--"Voidstorm",
    [2437] = C_Map.GetMapInfo(2437).name,	--"Zul'Aman",
    [2393] = C_Map.GetMapInfo(2393).name,	--"Silvermoon",
	[2424] = C_Map.GetMapInfo(2424).name, 	--"Isle of Quel'Danas"
	[2512] = C_Map.GetMapInfo(2512).name	--"The Coiled Isle"
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
	--[8443] = { ["zone"] = 2437, ["x"] = 24.8, ["y"] = 53.0 },
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
	--Atal'Utek
	-- "Gnarldor Isle"
	[8762] = { ["zone"] = 2512, ["x"] = 64.4, ["y"] = 77.7 },
	-- "The Ring of Glory"
	[8765] = { ["zone"] = 2512, ["x"] = 71.2, ["y"] = 56.5 },
	--Isle of Dorn
    -- "Earthcrawl Mines"
    [7863] = { ["zone"] = 2248, ["x"] = 38.6, ["y"] = 74.0 },
    -- "Fungal Folly"
    [7864] = { ["zone"] = 2248, ["x"] = 52.03, ["y"] = 65.77 },
    -- "Kriegval's Rest"
    [7865] = { ["zone"] = 2248, ["x"] = 62.19, ["y"] = 42.70 },
    --The Ringing Deeps
    -- "The Waterworks"
    [7866] = { ["zone"] = 2214, ["x"] = 42.15, ["y"] = 48.71 },
    -- "The Dread Pit"
    [7867] = { ["zone"] = 2214, ["x"] = 70.20, ["y"] = 37.3 },
    -- "Excavation Site 9"
    [8143] = { ["zone"] = 2214, ["x"] = 76.0, ["y"] = 96.50 },
    --Hallowfall
    -- "Mycomancer Cavern"
    [7869] = { ["zone"] = 2215, ["x"] = 71.3, ["y"] = 31.2 },
    -- "Nightfall Sanctum"
    [7785] = { ["zone"] = 2215, ["x"] = 34.32, ["y"] = 47.43 },
    -- "The Sinkhole"
    [7870] = { ["zone"] = 2215, ["x"] = 50.6, ["y"] = 53.3 },
    -- "Skittering Breach"
    [7871] = { ["zone"] = 2215, ["x"] = 65.48, ["y"] = 61.74 },
    --Azj-Kahet
    -- "The Spiral Weave"
    [7874] = { ["zone"] = 2255, ["x"] = 45.0, ["y"] = 19.0 },
    -- "Tak-Rethan Abyss"
    [7873] = { ["zone"] = 2255, ["x"] = 55.0, ["y"] = 73.92 },
    -- "The Underkeep"
    [7872] = { ["zone"] = 2255, ["x"] = 51.85, ["y"] = 88.30 },
    --Undermine
    -- "Sidestreet Sluice"
    [8140] = { ["zone"] = 2346, ["x"] = 35.20, ["y"] = 52.80 },
    -- "Demolition Dome"
    [8142] = { ["zone"] = 2346, ["x"] = 50.30, ["y"] = 9.60 },
    --K'aresh
    -- "Archival Assault"
    [8274] = { ["zone"] = 2371, ["x"] = 55.00, ["y"] = 48.00 }
}

worldQuestsIDs = {
    [93013] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(93013), ["saAreaPoid"] = 8524}, 		--"Special Assignment: Push back the Light"
    [92063] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(92063), ["saAreaPoid"] = 8523}, 		--"Special Assignment: A Hunter's Regret"
    [92145] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(92145), ["saAreaPoid"] = 8471 },		--"Special Assignment: Grand Magisters Drink"
 --   [91793] = {["saTitle"] ="Special Assignment: Into the Depths", ["saAreaPoid"] = ,
    [91796] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(91796), ["saAreaPoid"] = 8612 }, 	--"Special Assignment: Ours Once More!"
    [93244] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(93244), ["saAreaPoid"] = 8588 }, 	--"Special Assignment: Agents of the Shield"
	[92139] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(92139), ["saAreaPoid"] = 8695 }, 	--"Special Assignment: Shade and Claw"
	[91390] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(91390), ["saAreaPoid"] = 8611 },		--"Special Assignment: What Remains of a Temple Broken"
	[93438] = {["saTitle"] = C_QuestLog.GetTitleForQuestID(93438), ["saAreaPoid"] = 8585 }		--"Special Assignment: Precision Excision"
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
	--Atal'Utek
	-- "Gnarldor Isle"
	["Gnarldor Isle"] = { ["zone"] = 2512, ["x"] = 64.4, ["y"] = 77.7 },
	-- "The Ring of Glory"
	["The Ring of Glory"] = { ["zone"] = 2512, ["x"] = 71.2, ["y"] = 56.5 },
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
    ["Twilight Crypts"] = { ["zone"] = 2437, ["x"] = 25.4, ["y"] = 84.3 },
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
-- Collegiate Calamity
    ["8426"] = {
        ["Invasive Glow"] = "\124cffFF9C00S-Tier",
        ["Academy Under Siege"] = "\124cffa335eeA-Tier",
        ["Faculty of Fear"] = "\124cff0070ddB-Tier",
        -- DE
        ["Invasives Leuchten"] = "\124cffFF9C00S-Tier",
        ["Belagerte Akademie"] = "\124cffa335eeA-Tier",
        ["Fakultät der Furcht"] = "\124cff0070ddB-Tier",
        -- FR
        ["Luminescence envahissante"] = "\124cffFF9C00S-Tier",
        ["Académie assiégée"] = "\124cffa335eeA-Tier",
        ["Aptitude à la peur"] = "\124cff0070ddB-Tier",
        -- ES
        ["Resplandor invasivo"] = "\124cffFF9C00S-Tier",
        ["Academia asediada"] = "\124cffa335eeA-Tier",
        ["Facultad del miedo"] = "\124cff0070ddB-Tier",
    },
-- The Darkway
    ["8440"] = {
        ["Ogre Powered"] = "\124cffa335eeA-Tier",
        ["Focusers Under Pressure"] = "\124cff0070ddB-Tier",
        ["Leyline Technician"] = "D-Tier",
        -- DE
        ["Ogerbetrieben"] = "\124cffa335eeA-Tier",
        ["Fokussierer unter Druck"] = "\124cff0070ddB-Tier",
        ["Leylinientechniker"] = "D-Tier",
        -- FR
        ["Puissance ogre"] = "\124cffa335eeA-Tier",
        ["Focalisateurs sous pression"] = "\124cff0070ddB-Tier",
        ["Spécialiste de lignes telluriques"] = "D-Tier",
        -- ES
        ["Potenciamiento ogro"] = "\124cffa335eeA-Tier",
        ["Concentradores bajo presión"] = "\124cff0070ddB-Tier",
        ["Técnico de líneas Ley"] = "D-Tier",
    },
-- The Gulf of Memory
    ["8436"] = { 
        ["Sporasaur Special"] = "\124cffa335eeA-Tier",
        ["Alnmoth Munchies"] = "\124cff1eff00C-Tier",
        ["Descent of the Haranir"] = "D-Tier",
        -- DE
        ["Sporasaurus Spezial"] = "\124cffa335eeA-Tier",
        ["Heißhunger der Alnmotten"] = "\124cff1eff00C-Tier",
        ["Abstieg der Haranir"] = "D-Tier",
        -- FR (Korrigiert: Kein Artikel, kein Plural-s am Ende)
        ["Descente des Haranir"] = "D-Tier",
        ["Opération sporosaure"] = "\124cffa335eeA-Tier",
        ["Alnidés affamés"] = "\124cff1eff00C-Tier",
        -- ES
        ["Especial de esporasaurio"] = "\124cffa335eeA-Tier",
        ["Bocaditos para polillas de Aln"] = "\124cff1eff00C-Tier",
        ["Descenso de los haranir"] = "D-Tier",
    },
--Parhelion Plaza
    ["8428"] = {
        ["Holding the Line"] = "\124cffa335eeA-Tier",
        ["March of the Arcane Brigade"] = "\124cff9d9d9dF-Tier",
        ["Bombing Run"] = "\124cff9d9d9dF-Tier",
        -- DE
        ["Die Stellung halten"] = "\124cffa335eeA-Tier",
        ["Marsch der arkanen Brigade"] = "\124cff9d9d9dF-Tier",
        ["Bombenangriff"] = "\124cff9d9d9dF-Tier",
        -- FR
        ["Tenir le front"] = "\124cffa335eeA-Tier",
        ["La marche de la brigade des arcanes"] = "\124cff9d9d9dF-Tier",
        ["Mission de bombardement"] = "\124cff9d9d9dF-Tier",
        -- ES
        ["Ni un paso atrás"] = "\124cffa335eeA-Tier",
        ["La marcha de la brigada Arcana"] = "\124cff9d9d9dF-Tier",
        ["Bombardeo"] = "\124cff9d9d9dF-Tier",
    },
-- Sunkiller Sanctum
    ["8430"] = {
        ["Core of the Problem"] = "\124cff0070ddB-Tier",
        ["Not What I Expected"] = "\124cff1eff00C-Tier",
        ["The Gravitational Effect"] = "D-Tier",
        -- DE
        ["Der Kern des Problems"] = "\124cff0070ddB-Tier",
        ["Nicht, was ich erwartet hatte"] = "\124cff1eff00C-Tier",
        ["Der Gravitationseffekt"] = "D-Tier",
        -- FR
        ["Le cœur du problème"] = "\124cff0070ddB-Tier",
        ["Ce n’est pas ce à quoi je m’attendais"] = "\124cff1eff00C-Tier",
        ["L’effet gravitationnel"] = "D-Tier",
        -- ES
        ["El núcleo del problema"] = "\124cff0070ddB-Tier",
        ["No es lo que esperaba"] = "\124cff1eff00C-Tier",
        ["El efecto gravitatorio"] = "D-Tier",
    },
-- Twilight Crypts
    ["8442"] = {
        ["Party Crasher"] = "\124cff0070ddB-Tier",
        ["Trapped!"] = "\124cff1eff00C-Tier",
        ["Loosed Loa"] = "D-Tier",
        -- DE
        ["Ungeladene Gäste"] = "\124cff0070ddB-Tier",
        ["Gefangen!"] = "\124cff1eff00C-Tier",
        ["Gelöste Loa"] = "D-Tier",
        -- FR
        ["Trouble-fête"] = "\124cff0070ddB-Tier",
        ["Un piège !"] = "\124cff1eff00C-Tier",
        ["Loa libre"] = "D-Tier",
        -- ES
        ["Aguafiestas"] = "\124cff0070ddB-Tier",
        ["¡Atrapados!"] = "\124cff1eff00C-Tier",
        ["Loa a la fuga"] = "D-Tier",
    },
-- Atal'Aman
    ["8444"] = {
        ["Toadly Unbecoming"] = "\124cff0070ddB-Tier",
        ["Totem Annihilation"] = "\124cff1eff00C-Tier",
        ["Ritual Interrupted"] = "D-Tier",
        -- DE
        ["Krötal unwürdig"] = "\124cff0070ddB-Tier",
        ["Totemvernichtung"] = "\124cff1eff00C-Tier",
        ["Ritual unterbrochen"] = "D-Tier",
        -- FR
        ["Métamorphose indigne"] = "\124cff0070ddB-Tier",
        ["Annihilation de totem"] = "\124cff1eff00C-Tier",
        ["Rituel interrompu"] = "D-Tier",
        -- ES
        ["Sapos impropios"] = "\124cff0070ddB-Tier",
        ["Aniquilación de tótems"] = "\124cff1eff00C-Tier",
        ["Ritual interrumpido"] = "D-Tier",
    },
-- The Shadow Enclave
    ["8438"] = {
        ["Traitor's Due"] = "\124cff1eff00C-Tier",
        ["Mirror Shine"] = "\124cff9d9d9dF-Tier",
        ["Shadowy Supplies"] = "\124cff9d9d9dF-Tier",
        -- DE
        ["Schuld eines Verräters"] = "\124cff1eff00C-Tier",
        ["Spiegelglanz"] = "\124cff9d9d9dF-Tier",
        ["Schattenhafte Vorräte"] = "\124cff9d9d9dF-Tier",
        -- FR
        ["La rançon de la trahison"] = "\124cff1eff00C-Tier",
        ["Luisance de miroir"] = "\124cff9d9d9dF-Tier",
        ["Fournitures mystérieuses"] = "\124cff9d9d9dF-Tier",
        -- ES
        ["Castigo merecido"] = "\124cff1eff00C-Tier",
        ["Brillo de espejo"] = "\124cff9d9d9dF-Tier",
        ["Suministros sombríos"] = "\124cff9d9d9dF-Tier",
    },
 -- Shadowguard Point
    ["8432"] = {
        ["Calamitous"] = "D-Tier",
        ["Captured Wildlife"] = "\124cff9d9d9dF-Tier",
		["Captured Widlife"] = "\124cff9d9d9dF-Tier",
        ["Stolen Mana"] = "\124cff9d9d9dF-Tier",
        -- DE
        ["Verhängnisvoll"] = "D-Tier",
        ["Gefangene Tiere"] = "\124cff9d9d9dF-Tier",
        ["Gestohlenes Mana"] = "\124cff9d9d9dF-Tier",
        -- FR
        ["Calamité"] = "D-Tier",
        ["Faune capturée"] = "\124cff9d9d9dF-Tier",
        ["Mana volé"] = "\124cff9d9d9dF-Tier",
        -- ES
        ["Calamitoso"] = "D-Tier",
        ["Fauna cautiva"] = "\124cff9d9d9dF-Tier",
        ["Maná robado"] = "\124cff9d9d9dF-Tier",
    },
-- The Grudge Pit
    ["8434"] = {
        ["Arena Champion"] = "D-Tier",
        ["Lightbloom Invasion"] = "\124cff9d9d9dF-Tier",
        ["Dastardly Rotstalk"] = "\124cff9d9d9dF-Tier",
        -- DE
        ["Arenachampion"] = "D-Tier",
        ["Lichtblüteninvasion"] = "\124cff9d9d9dF-Tier",
        ["Durchtriebener Faulstrunk"] = "\124cff9d9d9dF-Tier",
        -- FR
        ["Championnat d’arène"] = "D-Tier",
        ["Invasion du luméclat"] = "\124cff9d9d9dF-Tier",
        ["Stipe-putride"] = "\124cff9d9d9dF-Tier",
        -- ES
        ["Campeón de la arena"] = "D-Tier",
        ["Invasión de la flor de Luz"] = "\124cff9d9d9dF-Tier",
        ["Acecho putrefacto despiadado"] = "\124cff9d9d9dF-Tier",
    }

}

-- Localization

dropDownOptionen = {   
	["enUS"] = "English",
    ["deDE"] = "Deutsch",
    ["frFR"] = "Français",
    ["esES"] = "Español",
	["follow"] = "Follow Client"
}
LanguageBase = {
["enUS"] 	= {
	["KeyOnChar"] = "key on this character\124r",
	["KeysOnChar"] = "keys on this character\124r",
	["shard"] = "shard of \124cff3088E0",
	["shards"] = "shards of \124cff3088E0",
	["shardWeek"] = "\124cffFFFFFF left to obtain from all sources",
	["KeyOnChar2"] = " key available from \124cff3088E0",
	["KeysOnChar2"] = " keys available from \124cff3088E0",
	["shards2"] = "\124cffFFFFFF shards\124r",
	["Journey"] = "|cffFFFFFFJourney Stage \124cff3088E0%d      \124cffFFFFFFCurrent Progress: \124cff3088E0%d \124cffFFFFFF/ %d |r",
	["GV"] = "Great Vault",
	["SLFG"] = "Start LFG",
	["FLFG"] = "Search LFG",
	["unlock"] = "  Delves unlock at Level 68",
	["noDelve"] = "  There are currently no bountiful Delves available",
	["dName"] = "Delve Name",
	["Zone"] = "Zone",
	["Wp"] = "Waypoint",
	["WQSubTitle"] = "WQs rewarding Coffer Key Shards. |cFF00DDFFRewards rotate – click Refresh.",
	["WQTitle"] = "\124cff3088E0World Quests rewarding Coffer Key Shards",
	["RFresh"] = "Refresh List",
	["NoWQ"] = "|cFFFF8040No active WQs with Coffer Key Shards as reward found.|r\nWait for daily refresh.",
	["No"] = "No ",
	["SA"] = "\124cff3088E0Special Assignments active. You finished ",
	["SA3"] = " of 3 this week ",
	["QName"] = "Quest Name",
	["OtherSource"] = "\124cff3088E0Other Coffer Key Shard Sources",
	["Finished"] = "You have finished this already this week.",
	["NotFinished"] ="You have not finished any this week.",
	["OtherText1"] = "Haradar's Legend Relics quests. 100 each. You have finished |cffFFFFFF",
	["OtherText2"] = "|r of 7 quests.\nSaltheril's Haven weekly quest. 100 each. |cffFFFFFF",
	["OtherText3"] = "|r\nPrey Quests award 75-112 each. You have done |cffFFFFFF",
	["OtherText4"] = "|r quests this week.\nWorld Map Rares award 50 each.\nWorld Map Treasures (Forgotten Amani Cache, etc.) 3-22 each. \nPreyseeker's Coffer Key Shard Satchels 50,60 or 80 depending on quality.\nBlue Fly-through stars may award 1-3",
	["RGear"] = "Recommended Gear",
	["BLoot"] = "Bountiful Loot",
	["Nemesis"] = "\124cff3088E0Seasonal Nemesis",
	["QDone"] = "You have finished the associated Quest 'Nulling Nullaeus'. ",
	["QLog"] = "You have the associated Quest in your Quest Log.",
	["QNot"] = "You have not done the associated Quest and can grab it at the Delvers HQ in Silvermoon, if you are eligible.",
	["THBLooted"] = " looted this week.\n",
	["THBNotLooted"] = "still available from any source this week.\n",
	["THBActive"] = " is active. Happy looting!",
	["THBBag"] =" in Bag, don't forget to use it",
	["BeaconInBag"] = " in your bags. Go get that Nemesis!",
	["BeaconNoNo"] = " in your backpack or bank and insufficient funds to buy one. \n(|cffE02E2E",
	["BeaconNoYes"] = " in your backpack or bank, but you got enough Undercoins to buy one. \n(",
	["Title"] = "\124cff3088ffBountiful Delves Hunter Midnight",
	["Toast"] = "|cffffd200Trovehunter Bounty detected!|r\nUse it for Hidden Treasure.",
	["MiniMap"] = "Minimap Button", 
	["Unselect1"] = "\124cff3088ffBountiful Delves", 
    ["Unselect2"] =  "\124cff3088ffTiers Overview",   	
    ["Unselect3"] =  "\124cff3088ffCoffer Shards WQs",	
	["Unselect4"] =  "\124cff3088ffAll Delve Waypoints",	
    ["Unselect5"] = "\124cff3088ffOptions",         	
	["Select1"] = "Bountiful Delves", 
    ["Select2"] = "Tiers Overview",   	
    ["Select3"] = "Coffer Shards WQs",	
	["Select4"] = "All Delve Waypoints",	
    ["Select5"] = "Options", 
	["ToggleLegacy"] = "TWW Delves",
	["Restoration_Warning"] = "Restoration Point Reminder",
	["OptionText"] = "This Addon is based on the original Bountiful Delves Helper by Menelitos. I loved that Addon and used it all the time, but at some point, it was no longer updated. I kept it current with line by line changes in TWW and Pre-Patch, but that was obviously not an option for Midnight. \nKudos to Menelitos for the original idea and general feel of the addon. \n\nI tried to add a little Midnight flavor to this with the color theme, hope you like it. \n\n* Tier List according to wowhead.com where S-Tier is fastest/easiest and F-Tier slowest/hardest. Visit their page for more great info on the delves.",
	["MiniHidden"] = "[Bountiful Delves Hunter] Minimap icon hidden, use /reload for it to take effect.",
	["MiniShown"] = "[Bountiful Delves Hunter] Minimap icon shown, use /reload for it to take effect.",
	["Shards"] = "Shards",
	["ChLang"] = "Chose Addon Language",
	["remind"] = "Changes will take effect on next addon start",
	["on"] = "\124cff2FE02Fon",
	["off"] = "\124cff9d9d9doff"
	},
["deDE"] 	= {
	["KeyOnChar"] = "Schlüssel auf diesem Character\124r",
	["KeysOnChar"] = "Schlüssel auf diesem Character\124r",
	["shard"] = "Splitter von \124cff3088E0",
	["shards"] = "Splitter von \124cff3088E0",
	["shardWeek"] = "\124cffFFFFFF diese Woche noch erhältlich aus allen Quellen",
	["KeyOnChar2"] = " Schlüssel verfügbar von \124cff3088E0",
	["KeysOnChar2"] = " Schlüssel verfügbar von \124cff3088E0",
	["shards2"] = "\124cffFFFFFF Splitter\124r",
	["Journey"] = "|cffFFFFFFReisestufe \124cff3088E0%d      \124cffFFFFFFAktueller Fortschritt: \124cff3088E0%d \124cffFFFFFF/ %d |r",
	["GV"] = "Große Schatzkammer",
	["SLFG"] = "LFG starten",
	["FLFG"] = "LFG suchen",
	["unlock"] = "  Tiefen werden auf Stufe 68 freigeschaltet",
	["noDelve"] = "  Derzeit sind keine ergiebigen Tiefen verfügbar",
	["dName"] = "Name der Tiefe",
	["Zone"] = "Zone",
	["Wp"] = "Wegpunkt",
	["WQSubTitle"] = "Weltquests mit Truhenschlüssel-Splittern. |cFF00DDFFBelohnungen rotieren – Aktualisieren klicken.",
	["WQTitle"] = "\124cff3088E0Weltquests mit Truhenschlüssel-Splittern",
	["RFresh"] = "Liste aktualisieren",
	["NoWQ"] = "|cFFFF8040Keine aktiven Weltquests mit Truhenschlüssel-Splittern gefunden.|r\nWarte auf die tägliche Aktualisierung.",
	["No"] = "Keine ",
	["SA"] = "\124cff3088E0Spezialaufträge aktiv. Du hast ",
	["SA3"] = " von 3 diese Woche abgeschlossen ",
	["QName"] = "Questname",
	["OtherSource"] = "\124cff3088E0Weitere Quellen für Truhenschlüssel-Splitter",
	["Finished"] = "Du hast dies diese Woche bereits abgeschlossen.",
	["NotFinished"] = "Du hast diese Woche noch nichts abgeschlossen.",
	["OtherText1"] = "Haradars Legendenrelikt-Quests. Je 100. Du hast |cffFFFFFF",
	["OtherText2"] = "|r von 7 Quests abgeschlossen.\nWöchentliche Quest in Saltherils Hafen. Je 100. |cffFFFFFF",
	["OtherText3"] = "|r\nBeutequests gewähren 75–112. Du hast |cffFFFFFF",
	["OtherText4"] = "|r Quests diese Woche erledigt.\nSeltene Gegner auf der Weltkarte gewähren 50.\nSchätze auf der Weltkarte (Vergessene Amani-Kiste usw.) 3–22.\nPreyseeker-Beutel mit Truhenschlüssel-Splittern gewähren 50, 60 oder 80 je nach Qualität.\nBlaue Flug-durch-Sterne können 1–3 gewähren.",
	["RGear"] = "Empfohlene Ausrüstung",
	["BLoot"] = "Ergiebige Beute",
	["Nemesis"] = "\124cff3088E0Saisonaler Nemesis",
	["QDone"] = "Du hast die zugehörige Quest 'Nulling Nullaeus' abgeschlossen. ",
	["QLog"] = "Du hast die zugehörige Quest im Questlog.",
	["QNot"] = "Du hast die zugehörige Quest noch nicht erledigt und kannst sie im Delvers-Hauptquartier in Silbermond annehmen, falls berechtigt.",
	["THBLooted"] = " diese Woche geplündert.\n",
	["THBNotLooted"] = " diese Woche noch aus allen Quellen verfügbar.\n",
	["THBActive"] = " ist aktiv. Viel Erfolg beim Plündern!",
	["THBBag"] =" im Beutel, vergiss nicht es zu benutzen",
	["BeaconInBag"] = " in deinen Taschen. Geh und besiege den Nemesis!",
	["BeaconNoNo"] = " in deinem Rucksack oder Bank und nicht genug Untercoins um einen zu kaufen.\n(|cffE02E2E",
	["BeaconNoYes"] = " in deinem Rucksack oder Bank, aber genug Untercoins um einen zu kaufen.\n(",
	["Title"] = "\124cff3088ffBountiful Delves Hunter Midnight",
	["Toast"] = "|cffffd200Belohnung des Schatzjägers entdeckt!|r\nBenutzen für einen verborgenen Schatz.",
	["MiniMap"] = "Minimap-Button",
	["Unselect1"] = "\124cff3088ffErgiebige Tiefen",
	["Unselect2"] = "\124cff3088ffTier-Übersicht",
	["Unselect3"] = "\124cff3088ffSplitter-WQs",
	["Unselect4"] = "\124cff3088ffAlle Tiefen-Wegpunkte",
	["Unselect5"] = "\124cff3088ffOptionen",
	["Select1"] = "Ergiebige Tiefen",
	["Select2"] = "Tier-Übersicht",
	["Select3"] = "Splitter-WQs",
	["Select4"] = "Alle Tiefen-Wegpunkte",
	["Select5"] = "Optionen",
	["ToggleLegacy"] = "TWW-Tiefen ",
	["Restoration_Warning"] = "Restoration Point Reminder",
	["OptionText"] = "Dieses Addon basiert auf dem ursprünglichen Bountiful Delves Helper von Menelitos. Ich habe dieses Addon geliebt und ständig benutzt, aber ab einem gewissen Zeitpunkt wurde es nicht mehr aktualisiert. Ich habe es in TWW und im Pre-Patch durch zeilenweise Änderungen aktuell gehalten, aber das war für Midnight offensichtlich keine Option mehr. \nEin großes Lob an Menelitos für die ursprüngliche Idee und das allgemeine Design des Addons. \n\nIch habe versucht, dem Ganzen mit dem Farbschema ein wenig Midnight-Flair zu verleihen, ich hoffe es gefällt euch. \n\n* Tier-List basierend auf wowhead.com, wobei S-Tier am schnellsten/einfachsten und F-Tier am langsamsten/schwersten ist. Besucht ihre Seite für weitere tolle Infos zu den Tiefen.",
	["MiniHidden"] = "[Bountiful Delves Hunter] Minimap-Icon versteckt, /reload erforderlich.",
	["MiniShown"] = "[Bountiful Delves Hunter] Minimap-Icon angezeigt, /reload erforderlich.",
	["Shards"] = "Splitter",
	["ChLang"] = "Auswahl Addon Sprache",
	["remind"] = "Sprachänderungen werden beim nächsten Start des Addons aktiv",
	["on"] = "\124cff2FE02Fan",
	["off"] = "\124cff9d9d9daus"
},
["frFR"] = {
	["KeyOnChar"] = "clé sur ce personnage\124r",
	["KeysOnChar"] = "clés sur ce personnage\124r",
	["shard"] = "fragment de \124cff3088E0",
	["shards"] = "fragments de \124cff3088E0",
	["shardWeek"] = "\124cffFFFFFF encore obtenables cette semaine depuis toutes les sources",
	["KeyOnChar2"] = " clé disponible depuis \124cff3088E0",
	["KeysOnChar2"] = " clés disponibles depuis \124cff3088E0",
	["shards2"] = "\124cffFFFFFF fragments\124r",
	["Journey"] = "|cffFFFFFFÉtape du voyage \124cff3088E0%d      \124cffFFFFFFProgression actuelle : \124cff3088E0%d \124cffFFFFFF/ %d |r",
	["GV"] = "Grand coffre",
	["SLFG"] = "Démarrer LFG",
	["FLFG"] = "Rechercher LFG",
	["unlock"] = "  Les Gouffres se débloquent au niveau 68",
	["noDelve"] = "  Aucun Gouffre abondant disponible actuellement",
	["dName"] = "Nom du Gouffre",
	["Zone"] = "Zone",
	["Wp"] = "Point de passage",
	["WQSubTitle"] = "Expéditions récompensant des fragments de clé. |cFF00DDFFLes récompenses tournent – cliquez sur Actualiser.",
	["WQTitle"] = "\124cff3088E0Expéditions récompensant des fragments de clé",
	["RFresh"] = "Actualiser la liste",
	["NoWQ"] = "|cFFFF8040Aucune expédition active avec fragments de clé trouvée.|r\nAttendez la réinitialisation quotidienne.",
	["No"] = "Pas de ",
	["SA"] = "\124cff3088E0Affectations spéciales actives. Vous avez terminé ",
	["SA3"] = " sur 3 cette semaine ",
	["QName"] = "Nom de quête",
	["OtherSource"] = "\124cff3088E0Autres sources de fragments de clé",
	["Finished"] = "Vous avez déjà terminé ceci cette semaine.",
	["NotFinished"] = "Vous n'avez encore rien terminé cette semaine.",
	["OtherText1"] = "Quêtes reliques légendaires de Haradar. 100 chacune. Vous avez terminé |cffFFFFFF",
	["OtherText2"] = "|r sur 7 quêtes.\nQuête hebdomadaire du Havre de Saltheril. 100 chacune. |cffFFFFFF",
	["OtherText3"] = "|r\nLes quêtes de chasse donnent 75-112 chacune. Vous en avez fait |cffFFFFFF",
	["OtherText4"] = "|r quêtes cette semaine.\nLes rares de la carte du monde donnent 50.\nLes trésors de la carte du monde (Cache amani oubliée, etc.) 3-22.\nLes sacoches de fragments de clé de Preyseeker donnent 50, 60 ou 80 selon la qualité.\nLes étoiles bleues en vol peuvent donner 1-3.",
	["RGear"] = "Équipement recommandé",
	["BLoot"] = "Butin abondant",
	["Nemesis"] = "\124cff3088E0Némésis saisonnier",
	["QDone"] = "Vous avez terminé la quête associée 'Nulling Nullaeus'. ",
	["QLog"] = "Vous avez la quête associée dans votre journal.",
	["QNot"] = "Vous n'avez pas encore fait la quête associée et pouvez l'obtenir au QG des Explorateurs à Lune-d'Argent si vous êtes éligible.",
	["THBLooted"] = " récupéré cette semaine.\n",
	["THBNotLooted"] = " encore disponible depuis toutes les sources cette semaine.\n",
	["THBActive"] = " est actif. Bonne chasse au trésor !",
	["THBBag"] =" dans votre sac, n'oubliez pas de l'utiliser",
	["BeaconInBag"] = " dans vos sacs. Allez affronter le Némésis !",
	["BeaconNoNo"] = " dans votre sac ou banque et fonds insuffisants pour en acheter un.\n(|cffE02E2E",
	["BeaconNoYes"] = " dans votre sac ou banque, mais vous avez assez de Sous-pièces pour en acheter un.\n(",
	["Title"] = "\124cff3088ffBountiful Delves Hunter Midnight",
	["Toast"] = "|cffffd200Prime Trovehunter détectée !|r\nUtilisez-la pour un trésor caché.",
	["MiniMap"] = "Bouton de la mini-carte",
	["Unselect1"] = "\124cff3088ffGouffres abondants",
	["Unselect2"] = "\124cff3088ffAperçu des tiers",
	["Unselect3"] = "\124cff3088ffExpéditions fragments",
	["Unselect4"] = "\124cff3088ffTous les points de Gouffre",
	["Unselect5"] = "\124cff3088ffOptions",
	["Select1"] = "Gouffres abondants",
	["Select2"] = "Aperçu des tiers",
	["Select3"] = "Expéditions fragments",
	["Select4"] = "Tous les points de Gouffre",
	["Select5"] = "Options",
	["ToggleLegacy"] = "Les Gouffres TWW",
	["Restoration_Warning"] = "Rappel du point de restauration",
	["OptionText"] = "Cet addon est basé sur le Bountiful Delves Helper original de Menelitos. J'ai adoré cet addon et je l'utilisais tout le temps, mais à un moment donné, il n'a plus été mis à jour. Je l'ai maintenu à jour avec des modifications ligne par ligne dans TWW et le pré-patch, mais ce n'était évidemment pas une option pour Midnight. \nFélicitations à Menelitos pour l'idée originale et l'esprit général de l'addon. \n\nJ'ai essayé d'ajouter une petite touche de Midnight à cela avec le thème de couleur, j'espère que vous aimerez. \n\n* Tier List selon wowhead.com où le S-Tier est le plus rapide/facile et le F-Tier le plus lent/difficile. Visitez leur page pour plus d'excellentes informations sur les gouffres.",
	["MiniHidden"] = "[Bountiful Delves Hunter] Icône minimap cachée, utilisez /reload pour appliquer.",
	["MiniShown"] = "[Bountiful Delves Hunter] Icône minimap affichée, utilisez /reload pour appliquer.",
	["Shards"] = "Fragments",
	["ChLang"] = "Choisir la langue de l'addon",
	["remind"] = "Les changements de langue prendront effet au prochain démarrage de l'addon",
	["on"] = "\124cff2FE02FAllumé",
	["off"] = "\124cff9d9d9dÉteint"
},
["esES"] = {
	["KeyOnChar"] = "llave en este personaje\124r",
	["KeysOnChar"] = "llaves en este personaje\124r",
	["shard"] = "fragmento de \124cff3088E0",
	["shards"] = "fragmentos de \124cff3088E0",
	["shardWeek"] = "\124cffFFFFFF aún disponibles esta semana de todas las fuentes",
	["KeyOnChar2"] = " llave disponible de \124cff3088E0",
	["KeysOnChar2"] = " llaves disponibles de \124cff3088E0",
	["shards2"] = "\124cffFFFFFF fragmentos\124r",
	["Journey"] = "|cffFFFFFFEtapa del viaje \124cff3088E0%d      \124cffFFFFFFProgreso actual: \124cff3088E0%d \124cffFFFFFF/ %d |r",
	["GV"] = "Gran bóveda",
	["SLFG"] = "Iniciar LFG",
	["FLFG"] = "Buscar LFG",
	["unlock"] = "  Las Profundidades se desbloquean al nivel 68",
	["noDelve"] = "  No hay profundidades abundantes disponibles actualmente",
	["dName"] = "Nombre de la profundidad",
	["Zone"] = "Zona",
	["Wp"] = "Punto de ruta",
	["WQSubTitle"] = "Misiones del mundo con fragmentos de llave. |cFF00DDFFLas recompensas rotan – pulsa actualizar.",
	["WQTitle"] = "\124cff3088E0Misiones del mundo con fragmentos de llave",
	["RFresh"] = "Actualizar lista",
	["NoWQ"] = "|cFFFF8040No se encontraron misiones con fragmentos de llave.|r\nEspera al reinicio diario.",
	["No"] = "No ",
	["SA"] = "\124cff3088E0Asignaciones especiales activas. Has completado ",
	["SA3"] = " de 3 esta semana ",
	["QName"] = "Nombre de misión",
	["OtherSource"] = "\124cff3088E0Otras fuentes de fragmentos de llave",
	["Finished"] = "Ya completaste esto esta semana.",
	["NotFinished"] = "No has completado ninguno esta semana.",
	["OtherText1"] = "Misiones reliquia legendaria de Haradar. 100 cada una. Has completado |cffFFFFFF",
	["OtherText2"] = "|r de 7 misiones.\nMisión semanal del Refugio de Saltheril. 100 cada una. |cffFFFFFF",
	["OtherText3"] = "|r\nLas misiones de presa otorgan 75-112 cada una. Has hecho |cffFFFFFF",
	["OtherText4"] = "|r misiones esta semana.\nLos raros del mapa mundial otorgan 50.\nTesoros del mapa mundial (Cofre amani olvidado, etc.) 3-22.\nLas bolsas de fragmentos de Preyseeker otorgan 50, 60 u 80 según la calidad.\nLas estrellas azules de vuelo pueden otorgar 1-3.",
	["RGear"] = "Equipo recomendado",
	["BLoot"] = "Botín abundante",
	["Nemesis"] = "\124cff3088E0Némesis de temporada",
	["QDone"] = "Has completado la misión asociada 'Nulling Nullaeus'. ",
	["QLog"] = "Tienes la misión asociada en tu registro.",
	["QNot"] = "No has hecho la misión asociada y puedes obtenerla en el cuartel de Delvers en Lunargenta si eres elegible.",
	["THBLooted"] = " obtenido esta semana.\n",
	["THBNotLooted"] = " aún disponible esta semana de cualquier fuente.\n",
	["THBActive"] = " está activo. ¡Feliz saqueo!",
	["THBBag"] =" en la bolsa, no olvides usarlo",
	["BeaconInBag"] = " en tus bolsas. ¡Ve a por ese Némesis!",
	["BeaconNoNo"] = " en tu mochila o banco y fondos insuficientes para comprar uno.\n(|cffE02E2E",
	["BeaconNoYes"] = " en tu mochila o banco, pero tienes suficientes Undercoins para comprar uno.\n(",
	["Title"] = "\124cff3088ffBountiful Delves Hunter Midnight",
	["Toast"] = "|cffffd200¡Recompensa de Trovehunter detectada!|r\nÚsala para un tesoro oculto.",
	["MiniMap"] = "Botón del minimapa",
	["Unselect1"] = "\124cff3088ffProfundidades abundantes",
	["Unselect2"] = "\124cff3088ffResumen de niveles",
	["Unselect3"] = "\124cff3088ffMisiones fragmentos",
	["Unselect4"] = "\124cff3088ffTodos los puntos de profundidad",
	["Unselect5"] = "\124cff3088ffOpciones",
	["Select1"] = "Profundidades abundantes",
	["Select2"] = "Resumen de niveles",
	["Select3"] = "Misiones fragmentos",
	["Select4"] = "Todos los puntos de profundidad",
	["Select5"] = "Opciones",
	["ToggleLegacy"] = "Profundidades TWW",
	["Restoration_Warning"] = "Recordatorio de punto de restauración",
	["OptionText"] = "Este addon está basado en el Bountiful Delves Helper original de Menelitos. Me encantaba ese addon y lo usaba todo el tiempo, pero en cierto punto dejó de actualizarse. Lo mantuve al día realizando cambios línea por línea en TWW y el preparche, pero obviamente eso no era una opción para Midnight. \nCréditos a Menelitos por la idea original y la esencia general del addon. \n\nIntenté darle un pequeño toque de Midnight con el tema de colores, espero que les guste. \n\n* Tier List según wowhead.com, donde S-Tier es el más rápido/fácil y F-Tier el más lento/difícil. Visita su página para obtener más información útil sobre las profundidades.",
	["MiniHidden"] = "[Bountiful Delves Hunter] Icono del minimapa oculto, usa /reload para aplicar.",
	["MiniShown"] = "[Bountiful Delves Hunter] Icono del minimapa mostrado, usa /reload para aplicar.",
	["Shards"] = "Fragmentos",
	["ChLang"] ="Elegir idioma del addon",
	["remind"] = "Los cambios de idioma se aplicarán la próxima vez que se inicie el addon",
	["on"] = "\124cff2FE02Fon",
	["off"] = "\124cff9d9d9doff"

}
}
