local sides = require("sides")
local place_dir = sides.south
local break_dir = sides.north
local bus_dir = sides.west
local set_bonsai = require("set_bonsai")
local component = require("component")
local event = require("event")
local m = component.modem
m.open(123)

args = {...}

function lpad(str, len, char)
    return string.rep(char, len - #str) .. str
end

id = lpad(args[1],3,"0")

while true do
  local _, _, from, port, _, message = event.pull("modem_message")
  set_bonsai.setBonsai(tostring(message))
  req_id = string.sub(message,0,3)
  if req_id == id then
    req_resource = string.sub(message, 4)
    print(req_resource)
    set_bonsai.setBonsai(place_dir, break_dir, bus_dir, req_resource)
  end
end
  
