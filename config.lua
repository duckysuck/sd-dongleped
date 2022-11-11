Config = {}

-- Blip Creation
Config.UseBlip = true
Config.BlipLocation = {
    {title="Shady Dealer", colour=37, id=280, x = -462.73, y = -66.37, z = 44.90},
}

-- If using an "Item" for money, for example money with ox_inventory
Config.CurrencyItem = "money"

-- Menu Contents
Config.RobberyList = {
    [1] = {
        bank = true,
        Header = "Fleeca Banks",
        icon = "fa-solid fa-building-columns",
        minCops = 0,
    },
    [2] = {
        bank = true,
        Header = "Paleto Bank",
        icon = "fa-solid fa-building-columns",
        minCops = 0,
    },
    [3] = {
        bank = true,
        Header = "Pacific Bank",
        icon = "fa-solid fa-building-columns",
        minCops = 0
    },
}

Config.Shop = {
    [1] = {
        item = "red_dongle",
        label = "Red Dongle",
        price = 5450,
        type = "cash",
        icon = "fa-solid fa-laptop-code",
    },
    [2] = {
        item = "blue_dongle",
        label = "Blue Dongle",
        price = 5450,
        type = "cash",
        icon = "fa-solid fa-laptop-code",
    },
    [3] = {
        item = "green_dongle",
        label = "Green Dongle",
        price = 5450,
        type = "cash",
        icon = "fa-solid fa-laptop-code",
    },
    [4] = {
        item = "yellow_dongle",
        label = "Yellow Dongle",
        price = 5450,
        type = "cash",
        icon = "fa-solid fa-laptop-code",
    },
    [5] = {
        item = "black_dongle",
        label = "Black Dongle",
        price = 5450,
        type = "cash",
        icon = "fa-solid fa-laptop-code",
    }
}
