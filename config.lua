Config = {}

Config.MenuItems = {
    [4] = {
        id = 'jobinteractions',
        title = 'Job',
        icon = 'briefcase',
        items = {} -- bleibt wie bisher, wird durch Job abhängig dynamisch ergänzt
    },
    [1] = {
        id = 'person',
        title = 'Person',
        icon = 'user',
        items = {
            { id = 'release', title = 'Freilassen', icon = 'door-open', type = 'client', event = 'player:release', shouldClose = true },
            { id = 'putinvehicle', title = 'In Fahrzeug', icon = 'car', type = 'client', event = 'player:putInVehicle', shouldClose = true },
            { id = 'outvehicle', title = 'Aus Fahrzeug', icon = 'car-side', type = 'client', event = 'player:takeOutVehicle', shouldClose = true },
            { id = 'hostage', title = 'Geisel', icon = 'child', type = 'cmd', event = 'TakeHostage', shouldClose = true },
            { id = 'carry', title = 'Tragen', icon = 'user-friends', type = 'cmd', event = 'carry', shouldClose = true },
            { id = 'search', title = 'Durchsuchen', icon = 'search', type = 'cmd', event = 'search', shouldClose = true },
            { id = 'steal', title = 'Nehmen', icon = 'mask', type = 'cmd', event = 'steal', shouldClose = true },
            { id = 'arrest', title = 'Festnehmen', icon = 'user-lock', type = 'client', event = 'player:arrest', shouldClose = true }
        }
    },
	[3] = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {
			{
				id = 'vehiclewindows',
				title = 'Fenster',
				icon = 'window-maximize',
				items = {
					{
						id = 'window0',
						title = 'Fahrerfenster',
						icon = 'window-maximize',
						type = 'client',
						event = 'custom:radialmenu:toggleWindow',
						shouldClose = false
					}, {
						id = 'window1',
						title = 'Beifahrerfenster',
						icon = 'window-maximize',
						type = 'client',
						event = 'custom:radialmenu:toggleWindow',
						shouldClose = false
					}, {
						id = 'window2',
						title = 'Hinten links',
						icon = 'window-maximize',
						type = 'client',
						event = 'custom:radialmenu:toggleWindow',
						shouldClose = false
					}, {
						id = 'window3',
						title = 'Hinten rechts',
						icon = 'window-maximize',
						type = 'client',
						event = 'custom:radialmenu:toggleWindow',
						shouldClose = false
					}
				}
            },
            {
                id = 'vehicleseats',
                title = 'Sitz',
                icon = 'chair',
                items = {
                    {
                        id = 'door0',
                        title = 'Fahrer',
                        icon = 'chair',
                        type = 'client',
                        event = 'qb-radialmenu:client:ChangeSeat',
                        shouldClose = false
                    }
                }
            },
			{
                id = 'vehicledoors',
                title = 'Türen',
                icon = 'car-side',
                items = {
                    {
                        id = 'door0',
                        title = 'Fahrertür',
                        icon = 'car-side',
                        type = 'client',
                        event = 'custom:radialmenu:toggleDoor',
                        shouldClose = false
                    }, {
                        id = 'door4',
                        title = 'Motorhaube',
                        icon = 'car',
                        type = 'client',
                        event = 'custom:radialmenu:toggleDoor',
                        shouldClose = false
                    }, {
                        id = 'door1',
                        title = 'Beifahrertür',
                        icon = 'car-side',
                        type = 'client',
                        event = 'custom:radialmenu:toggleDoor',
                        shouldClose = false
                    }, {
                        id = 'door3',
                        title = 'Rechts hinten',
                        icon = 'car-side',
                        type = 'client',
                        event = 'custom:radialmenu:toggleDoor',
                        shouldClose = false
                    }, {
                        id = 'door5',
                        title = 'Kofferraum',
                        icon = 'car',
                        type = 'client',
                        event = 'custom:radialmenu:toggleDoor',
                        shouldClose = false
                    }, {
                        id = 'door2',
                        title = 'Hinten links',
                        icon = 'car-side',
                        type = 'client',
                        event = 'custom:radialmenu:toggleDoor',
                        shouldClose = false
                    }, {
						id = 'toggledoors',
						title = 'Alle Türen auf/zu',
						icon = 'door-open',
						type = 'client',
						event = 'custom:radialmenu:toggleAllDoors',
						shouldClose = false
				}
				}
			}
		}
    },
    [2] = {
        id = 'general',
        title = 'General',
        icon = 'list-alt',
        items = {
            {
                id = 'keys',
                title = 'Schlüssel',
                icon = 'key',
                type = 'client',
                event = 'general:keys',
                shouldClose = true
            },
            {
                id = 'invoices',
                title = 'Rechnungen',
                icon = 'file-invoice-dollar',
                type = 'client',
                event = 'okokBilling:ToggleMyInvoices',
                shouldClose = true
            },
            {
                id = 'documents',
                title = 'Dokumente',
                icon = 'file-alt',
                type = 'cmd',
                event = 'documents',
                shouldClose = true
            },
            {
				id = 'clothing',
				title = 'Kleidung',
				icon = 'tshirt',
				items = {
					{ id = 'top', title = 'Oberteil', icon = 'tshirt', type = 'cmd', event = 'top', shouldClose = false },
					{ id = 'shirt', title = 'Shirt', icon = 'tshirt', type = 'cmd', event = 'Shirt', shouldClose = false },
					{ id = 'pants', title = 'Hose', icon = 'user', type = 'cmd', event = 'Pants', shouldClose = false },
					{ id = 'shoes', title = 'Schuhe', icon = 'shoe-prints', type = 'cmd', event = 'shoes', shouldClose = false },
					{ id = 'gloves', title = 'Handschuhe', icon = 'mitten', type = 'cmd', event = 'gloves', shouldClose = false },
					{
						id = 'accessories',
						title = 'Accessoires',
						icon = 'plus',
						items = {
							{ id = 'hat', title = 'Hut', icon = 'hat-cowboy-side', type = 'cmd', event = 'hat', shouldClose = false },
							{ id = 'glasses', title = 'Brille', icon = 'glasses', type = 'cmd', event = 'glasses', shouldClose = false },
							{ id = 'ear', title = 'Ohr', icon = 'deaf', type = 'cmd', event = 'ear', shouldClose = false },
							{ id = 'watch', title = 'Uhr', icon = 'stopwatch', type = 'cmd', event = 'watch', shouldClose = false },
							{ id = 'bracelet', title = 'Armband', icon = 'user', type = 'cmd', event = 'bracelet', shouldClose = false },
							{ id = 'neck', title = 'Kette', icon = 'user-tie', type = 'cmd', event = 'neck', shouldClose = true },
							{ id = 'mask', title = 'Maske', icon = 'theater-masks', type = 'cmd', event = 'mask', shouldClose = false },
							{ id = 'bag', title = 'Tasche', icon = 'shopping-bag', type = 'cmd', event = 'bag', shouldClose = false },
							{ id = 'vest', title = 'Weste', icon = 'vest', type = 'cmd', event = 'vest', shouldClose = false }
						}
					}
				}
			},
            {
                id = 'wallet',
                title = 'Brieftasche',
                icon = 'wallet',
                items = {
                    {
                        id = 'idcard',
                        title = 'Ausweis',
                        icon = 'id-card',
						items = {
							{
								id = 'show_id',
								title = 'Ausweis zeigen',
								icon = 'share',
								type = 'client',
								event = 'wallet:showDocument',
								args = 'id',
								shouldClose = true
							},
							{
								id = 'view_id',
								title = 'Ausweis anschauen',
								icon = 'eye',
								type = 'client',
								event = 'wallet:showDocument',
								args = 'id',
								shouldClose = true
							}
						}
                    },
                    {
                        id = 'driverlicense',
                        title = 'Führerschein',
                        icon = 'id-badge',
                        items = {
							{
								id = 'show_driver',
								title = 'Führerschein zeigen',
								icon = 'share',
								type = 'client',
								event = 'wallet:showDocument',
								args = 'driver',
								shouldClose = true
							},
							{
								id = 'view_driver',
								title = 'Führerschein anschauen',
								icon = 'eye',
								type = 'client',
								event = 'wallet:viewDocument',
								args = 'driver',
								shouldClose = true
							}
						}
					},
                    {
                        id = 'gunlicense',
                        title = 'Waffenschein',
                        icon = 'shield-alt',
                        type = 'client',
                        event = 'wallet:showGunLicense',
                        shouldClose = true
                    },
                    {
                        id = 'huntlicense',
                        title = 'Jagdschein',
                        icon = 'paw',
                        type = 'client',
                        event = 'wallet:showHuntLicense',
                        shouldClose = true
                    }
                }
            }
        }
    },
}

Config.JobInteractions = {
    ["ambulance"] = { -- pb-ambulancejob:EMSbed pb-ambulancejob:EMSrevive
        {
            id = 'statuscheck',
            title = 'Person durchsuchen',
            icon = 'stethoscope',
            type = 'client',
            event = 'pb-ambulancejob:examine',
            shouldClose = true
        },
        {
            id = 'reviveplayer',
            title = 'Wiederbeleben',
            icon = 'heartbeat',
            type = 'client',
            event = 'pb-ambulancejob:EMSrevive',
            shouldClose = true
        },
        {
            id = 'healwounds',
            title = 'Wunden heilen',
            icon = 'band-aid',
            type = 'client',
            event = 'pb-ambulancejob:HealWounds',
            shouldClose = true
        },
        {
            id = 'treatinjuries',
            title = 'Verletzungen behandeln',
            icon = 'suitcase-medical',
            type = 'client',
            event = 'pb-ambulancejob:TreatInjuries',
            shouldClose = true
        },
        {
            id = 'emergencybutton2',
            title = 'Panik-Knopf',
            icon = 'bell',
            type = 'client',
            event = 'pb-police:omgad',
            shouldClose = true
        },
        {
            id = 'brancardoptions',
            title = 'Krankentrage',
            icon = 'procedures',
            items = {
                {
                    id = 'spawnbrancard',
                    title = 'Spawn Krankentrage',
                    icon = 'plus',
                    type = 'client',
                    event = 'hospital:client:TakeBrancard',
                    shouldClose = false
                }, {
                    id = 'despawnbrancard',
                    title = 'Entferne Krankentrage',
                    icon = 'minus',
                    type = 'client',
                    event = 'hospital:client:RemoveBrancard',
                    shouldClose = false
                }
            }
        },
        {
            id = 'ambulanceactions',
            title = 'LSMD-Aktionen',
            icon = 'tasks',
            items = {
                {
                    id = 'escort',
                    title = 'Begleiten',
                    icon = 'user-friends',
                    type = 'client',
                    event = 'pb-police:escort',
                    shouldClose = true
                },
                {
                    id = 'putpersoninsidecar',
                    title = 'Ins Fahrzeug setzen',
                    icon = 'door-open',
                    type = 'client',
                    event = 'pb-ambulancejob:CLputInVehicle',
                    shouldClose = true
                },
                {
                    id = 'putpersonoutofcar',
                    title = 'Fahrzeug herausnehmen',
                    icon = 'door-closed',
                    type = 'client',
                    event = 'EMS:takeOutVehicle',
                    shouldClose = true
                },
                {
                    id = 'putpersoninbed',
                    title = 'Ins Bett legen',
                    icon = 'bed',
                    type = 'client',
                    event = 'pb-ambulancejob:EMSbed',
                    shouldClose = true
                },
            }
        }
    },
    ["taxi"] = {
        -- {
        --     id = 'togglemeter',
        --     title = 'Show/Hide Meter',
        --     icon = 'eye-slash',
        --     type = 'client',
        --     event = 'qb-taxi:client:toggleMeter',
        --     shouldClose = false
        -- }, {
        --     id = 'togglemouse',
        --     title = 'Start/Stop Meter',
        --     icon = 'hourglass-start',
        --     type = 'client',
        --     event = 'qb-taxi:client:enableMeter',
        --     shouldClose = true
        -- }, {
        --     id = 'npc_mission',
        --     title = 'NPC Mission',
        --     icon = 'taxi',
        --     type = 'client',
        --     event = 'qb-taxi:client:DoTaxiNpc',
        --     shouldClose = true
        -- }
    },
    ["mechanic"] = {
        -- {
        --     id = 'togglenpc',
        --     title = 'Toggle NPC',
        --     icon = 'toggle-on',
        --     type = 'client',
        --     event = 'jobs:client:ToggleNpc',
        --     shouldClose = true
        -- }, {
        --     id = 'towvehicle',
        --     title = 'Tow vehicle',
        --     icon = 'truck-pickup',
        --     type = 'client',
        --     event = 'qb-tow:client:TowVehicle',
        --     shouldClose = true
        -- }
    },
    ["police"] = {
        {
            id = 'mdt',
            title = 'MDT',
            icon = 'tablet',
            type = 'cmd',
            event = 'copnet',
            shouldClose = true
        },
        {
            id = 'gsrtest',
            title = 'GSR Test',
            icon = 'person-rifle',
            type = 'cmd',
            event = 'gsrtest',
            shouldClose = true
        },
        {
            id = 'emergencybutton',
            title = 'Panik-Knopf',
            icon = 'bell',
            type = 'client',
            event = 'pb-police:omgad',
            shouldClose = true
        },
        {
            id = 'k9menu',
            title = 'K9',
            icon = 'dog',
            items = {
                {
                    id = 'K9spawn',
                    title = 'Take Out',
                    icon = 'house-damage',
                    type = 'client',
                    event = 'pb-k9:k9spawn',
                    shouldClose = true
                },
                -- {
                --     id = 'K9attack',
                --     title = 'Attack',
                --     icon = 'burst',
                --     type = 'client',
                --     event = 'pb-k9:k9attack',
                --     shouldClose = true
                -- },
                {
                    id = 'K9attack',
                    title = 'Angriff einstellen',
                    icon = 'shield-alt',
                    type = 'client',
                    event = 'pb-k9:k9stopattack',
                    shouldClose = true
                },
                {
                    id = 'K9drug',
                    title = 'Person schnüffeln',
                    icon = 'cannabis',
                    type = 'client',
                    event = 'pb-k9:k9searchdrugs',
                    shouldClose = true
                },
                {
                    id = 'K9car',
                    title = 'Get In/Out Car',
                    icon = 'door-open',
                    type = 'client',
                    event = 'pb-k9:getincar',
                    shouldClose = true
                },
                {
                    id = 'K9attack',
                    title = 'Befehle erteilen',
                    icon = 'hand-point-left',
                    items = {
                        {
                            id = 'K9come',
                            title = 'Komm her',
                            icon = 'paw',
                            type = 'client',
                            event = 'pb-k9:come',
                            shouldClose = false
                        },
                        {
                            id = 'K9stay',
                            title = 'Bleib',
                            icon = 'paw',
                            type = 'client',
                            event = 'pb-k9:k9idle',
                            shouldClose = false
                        },
                        {
                            id = 'K9stay2',
                            title = 'Bleib 2',
                            icon = 'paw',
                            type = 'client',
                            event = 'pb-k9:k9idle2',
                            shouldClose = false
                        },
                        {
                            id = 'K9sit',
                            title = 'Sitz',
                            icon = 'paw',
                            type = 'client',
                            event = 'pb-k9:k9sit',
                            shouldClose = false
                        },
                        {
                            id = 'K9lie',
                            title = 'Hinlegen',
                            icon = 'paw',
                            type = 'client',
                            event = 'pb-k9:k9liedown',
                            shouldClose = false
                        },
                        {
                            id = 'K9Stand',
                            title = 'Stand',
                            icon = 'paw',
                            type = 'client',
                            event = 'pb-k9:k9stand',
                            shouldClose = false
                        },
                    }
                },
            }
        },
        -- {
        --     id = 'checkvehstatus',
        --     title = 'Check Tune Status',
        --     icon = 'info-circle',
        --     type = 'car',
        --     event = 'qb-tunerchip:server:TuneStatus',
        --     shouldClose = true
        -- }, {
        --     id = 'resethouse',
        --     title = 'Reset house lock',
        --     icon = 'key',
        --     type = 'client',
        --     event = 'qb-houses:client:ResetHouse',
        --     shouldClose = true
        -- }, {
        --     id = 'takedriverlicense',
        --     title = 'Revoke Drivers License',
        --     icon = 'id-card',
        --     type = 'client',
        --     event = 'police:client:SeizeDriverLicense',
        --     shouldClose = true
        -- },
        {
            id = 'policeinteraction',
            title = 'LSPD-Aktionen',
            icon = 'tasks',
            items = {
                -- {
                --     id = 'statuscheck',
                --     title = 'Check Health Status',
                --     icon = 'heartbeat',
                --     type = 'client',
                --     event = 'hospital:client:CheckStatus',
                --     shouldClose = true
                -- },
                -- {
                --     id = 'checkstatus',
                --     title = 'Check status',
                --     icon = 'question',
                --     type = 'client',
                --     event = 'police:client:CheckStatus',
                --     shouldClose = true
                -- },
                {
                    id = 'LSPDputinvehicle',
                    title = 'Put in/out vehicle',
                    icon = 'door-open',
                    type = 'client',
                    event = 'LSPD:putinvehicle',
                    shouldClose = true
                },
                {
                    id = 'escort',
                    title = 'Escort',
                    icon = 'user-friends',
                    type = 'client',
                    event = 'pb-police:escort',
                    shouldClose = true
                },
                {
                    id = 'searchplayer',
                    title = 'Search',
                    icon = 'search',
                    type = 'cmd',
                    event = 'search',
                    shouldClose = true
                },
                -- {
                --     id = 'jailplayer',
                --     title = 'Jail',
                --     icon = 'user-lock',
                --     type = 'client',
                --     event = 'police:client:JailPlayer',
                --     shouldClose = true
                -- }
            }
        }, {
            id = 'policeobjects',
            title = 'Objekte',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Kegel',
                    icon = 'exclamation-triangle',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Tor',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Tempolimit-Schild',
                    icon = 'sign',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Zelt',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Beleuchtung',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                },
                -- {
                --     id = 'spikestrip',
                --     title = 'Spike Strips',
                --     icon = 'caret-up',
                --     type = 'client',
                --     event = 'police:client:SpawnSpikeStrip',
                --     shouldClose = false
                -- },
                {
                    id = 'spikestrip',
                    title = 'Spike-Streifen',
                    icon = 'caret-up',
                    type = 'cmd',
                    event = 'spikes',
                    shouldClose = false
                },
                {
                    id = 'deleteobject',
                    title = 'Objekt entfernen',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    -- ["hotdog"] = {
    --     {
    --         id = 'togglesell',
    --         title = 'Toggle sell',
    --         icon = 'hotdog',
    --         type = 'client',
    --         event = 'qb-hotdogjob:client:ToggleSell',
    --         shouldClose = true
    --     }
    -- }
    -- ["jobname"] = {

    -- },
}

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans  
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs  
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle  
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics  
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports  
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super  
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles  
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road  
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial  
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility  
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans  
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles  
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats  
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters  
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes  
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service  
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency  
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military  
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial  
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains  
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Ziehe dein Hemd aus/an",
        Button = 1,
        Name = "Oberkörper"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("Gloves") end,
        Sprite = "gloves",
        Desc = "Handschuhe ausziehen/anziehen",
        Button = 2,
        Name = "Handschuhe"
    },
    ["visor"] = {
        Func = function() ToggleProps("Visor") end,
        Sprite = "visor",
        Desc = "Toggle hat variation",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Opens or closes your bag",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Take your shoes off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Take your vest off/on",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("Hair") end,
        Sprite = "hair",
        Desc = "Put your hair up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Hut ab/aufsetzen",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Brille abnehmen/aufsetzen",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Nehmen Sie Ihr Ohrzubehör ab/an",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Take your neck accessory off/on",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Take your watch off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Take your bracelet off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
}

local Bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ["pants"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Take your pants off/on",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["shirt"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Take your shirt off/on",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["resetclothes"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Nothing To Reset', 'error')
            end
        end,
        Sprite = "reset",
        Desc = "Alles wieder in den Normalzustand versetzen",
        Name = "resetclothes",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["bagoff"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if Bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if Bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Tasche abnehmen/aufsetzen",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}