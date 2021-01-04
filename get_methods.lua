arg = {...}

component_name = arg[1]

function exploreTable(tbl, prefix)
  prefix = prefix or ""
  for k,v in pairs(tbl) do
    if type(v) == "table" then
      print(prefix..k..": ")
      exploreTable(v, prefix.."  ")
    elseif type(v) == "function" then
      print(prefix.."key: "..k.." function")
    else
      print(prefix..k..": "..tostring(v))
    end
  end
end


local component = require("component")
for k,v in component.list() do
  if v == component_name then
    exploreTable(component.methods(k))
  end
end
