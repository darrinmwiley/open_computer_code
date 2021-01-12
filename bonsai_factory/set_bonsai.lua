local function set_bonsai(place_dir, break_dir, bus_dir, resource)
  local utils = require("utils")
  local component = require("component")
  local sap = require("db_util")
  local redstone = component.redstone
  local bus = component.me_exportbus
  
  db_addr = utils.getAddress("database")

  print("resource is "..resource)
  print(sap[resource])
  
  index = sap[resource]
  
  if index ~= nil then
    bus.setExportConfiguration(bus_dir,1,db_addr, index)
    --precondition of the redstone default outputs being on for place_dir and break_dir
    redstone.setOutput(break_dir, 0)
    os.sleep(.021)
    redstone.setOutput(break_dir, 15)
    os.sleep(.021)
    redstone.setOutput(place_dir, 0)
    os.sleep(.021)
    redstone.setOutput(place_dir,15)
  end
end

return {setBonsai = set_bonsai}
