---@diagnostic disable: secrets:S6708
Config = {}

Config.Background = true
Config.DisplayOnChat = false

Config.EnablePlayerName = true
Config.UseESXRPName = false

Config.Debug = true

Config.LogDiscord = true
Config.LogWebhook = "https://discord.com/api/webhooks/1259176339995492486/jfEvTygc9wEjZzoqlczcEZ2zS-aNj3LVMPczPPT2A9QTTW5Gge6uiri0E53LbnQCkGDa"

Config.CheckForUpdates = true
Config.Version = '1.0'

---------- Advanced options ----------
-- Config.TextColor_Me         = { r = 255, g = 255, b = 255, a = 255 } -- Adjust the text color (3D and the Chat too)
-- Config.TextColor_Do         = { r = 255, g = 255, b = 255, a = 255 }
-- Config.TextColor_Try        = { r = 255, g = 255, b = 255, a = 255 }

Config.Commands = {
    ['odme'] = {
        TextColor = { r = 255, g = 255, b = 255, a = 255 },
        BackgroundColor = { r = 63, g = 153, b = 247, a = 150 },
        Text = "Action"
    },
    ['oddo'] = {
        TextColor = { r = 255, g = 255, b = 255, a = 255 },
        BackgroundColor =   { r = 202, g = 37, b = 78, a = 150 },
        Text = "Happening"
    },
    ['odtry'] = {
        TextColor = { r = 255, g = 255, b = 255, a = 255 },
        BackgroundColor = { r = 22, g = 173, b = 196, a = 150 },
        Text = "Trying"
    },
    ['default'] = {
        TextColor = { r = 255, g = 255, b = 255, a = 255 },
        BackgroundColor = { r = 22, g = 173, b = 196, a = 150 },
        Text = "Default"
    }
}

-- Config.BackgroundColor_Me   = { r = 63, g = 153, b = 247, a = 150 } -- Adjust the background color (3D and the Chat too)
-- Config.BackgroundColor_Do   = { r = 202, g = 37, b = 78, a = 150 }
-- Config.BackgroundColor_Try  = { r = 22, g = 173, b = 196, a = 150 }

Config.Duration             = 5 -- Text duration (in seconds)
Config.Distance             = 10 -- Who can see my action inside the distance (in meter)
Config.TryChance            = 50 -- Chance of the try action (in %)
Config.DropShadow           = false -- Drop shadow (3D text)
Config.Font                 = 4 -- Font type in number (3D text)