local component = require("component")

local tab = {}

local ct = 1

for line in io.lines("saplings.db") do
  tab[ct] = line
  ct = ct + 1
end

local namedmg_id = {}

for i = 1,ct-1,3 do
  local namedmg = tab[i+1]..tostring(tab[i+2])
  local namedmg_id[namedmg] = tab[i]
end

local sap = {}

local db = component.database;

for i = 1, 81, 1 do
  local s = db.get(i)
  if s ~= nil then
    local namedmg = s.name..tostring(s.damage)
    print(namedmg)
    print(i)
    print()
    sap[namedmg_id[namedmg]] = i
  end
end

for k, v in pairs(sap) do
  print(k)
  print(v)
  print()
end
