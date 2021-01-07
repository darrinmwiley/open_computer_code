args = {...}

local utils = require("utils")
local component = require("component")
local sides = require("sides")

local export_bus = component.me_exportbus
local database = component.database
local redstone = component.redstone

db_addr = utils.getAddress("database")

export_bus.setExportConfiguration(5,1,db_addr, args[1])

redstone.setOutput(sides.west, 0)
os.sleep(1)
redstone.setOutput(sides.west, 15)
os.sleep(1)
redstone.setOutput(sides.west, 0)

redstone.setOutput(sides.south, 0)
os.sleep()
redstone.setOutput(sides.south, 15)
os.sleep()
redstone.setOutput(sides.south, 0)
