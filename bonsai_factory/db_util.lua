local component = require("component")

local tab = {}

local ct = 1

for line in io.lines("saplings.db") do
  tab[ct] = line
  ct = ct + 1
end

local sap_dmg = {}
local sap_name = {}

for i = 1,ct-1,3 do
  local id = tab[i]
  local name = tab[i+1]
  local dmg = tab[i+2]
  print(id)
  print(name)
  print(dmg)
  print()
  sap_dmg[id] = dmg
  sap_name[id] = name
end

local sap = {}

local db = component.database;

for i = 1, 81, 1 do
  local s = db.get(i)
  if s ~= nil then
    for k, v in pairs(sap_dmg) do
      if sap_name[k] == s.name and sap_dmg[k] == s.damage then
        sap[k] = i
      end
    end
  end
end

for k, v in pairs(sap) do
  print(k)
  print(v)
  print()
end
