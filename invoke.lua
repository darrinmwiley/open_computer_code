arg = {...}

name = arg[1]
method = arg[2]

local component = require("component")
for k,v in component.list() do
  if v == name then
    print(component.invoke(k, method))
  end
end
