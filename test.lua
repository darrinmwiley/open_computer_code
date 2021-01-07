local utils = require("utils")
local component = require("component")

local export_bus = component.me_exportbus
local database = component.database

db_addr = utils.getAddress("database")
export_bus.setExportConfiguration(5,1,db_addr,1)
