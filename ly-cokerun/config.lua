Config = {}


Config.MinimumMethJobPolice = 0
Config.Cooldown = 360 --- Cooldown until next allowed meth run
Config.RunCost = 1500 --- Self explanatory 

Config.Payout = math.random(150000, 220000) -- How much you get paid
Config.Item = "coke" -- The item you receive from the job
Config.CokeChance = 350 -- Percentage chance to get meth
Config.CokeAmount = math.random(20, 30) -- Amount of meth you recieve

Config.SpecialRewardChance = 300 -- Percentage of getting rare item on job. Multiplied by 100. 0.1% = 1, 1% = 10, 20% = 200, 50% = 500, etc. Default 0.1%.
Config.SpecialItem = "weapon_mg" -- Put a rare item here which will have 0.1% chance of being given on the run.

Config.BossLocation = vector3(481.18, -591.21, 23.75)
Config.Itemtime = 300 * 1000 -- 5 minutes (time for the case to open after you collect it)
Config.Carspawn = vector3(1098.0, -2290.5, 30.12) -- Spawn location for vehicle (it serves not purpose just there...)

Config['cokeguards'] = {
    ['npcguards'] = {
        { coords = vector3(1092.8, -2278.14, 30.15), heading = 230.37, model = 'csb_mweather'},
        { coords = vector3(1112.71, -2300.38, 30.51), heading = 162.91, model = 'csb_mweather'},
        { coords = vector3(1126.55, -2276.56, 30.85), heading = 110.91, model = 'csb_mweather'},
        { coords = vector3(1092.88, -2330.26, 30.17), heading = 18.9, model = 'csb_mweather'},
        { coords = vector3(1086.05, -2322.72, 30.2), heading = 352.57, model = 'csb_mweather'},
        { coords = vector3(1086.08, -2300.04, 30.2), heading = 309.68, model = 'csb_mweather'},
    },
}
