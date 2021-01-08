local addr_tab = {}
local arr = {}
local ct = 1

for line in io.lines("addr_db") do
  arr[ct] = line
  ct = ct + 1
end

for i = 1,ct-1, 2 do
  addr_tab[arr[i]] = arr[i+1]
end
  
local component = require("component")
local event = require("event")
local m = component.modem
m.open(123)

args = {...}

name = args[1]
message = args[2]

m.send(addr_tab[name], message)
  
  
